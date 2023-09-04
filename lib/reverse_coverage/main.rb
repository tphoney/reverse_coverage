# frozen_string_literal: true

Coverage.start

# rspec support
module ReverseCoverageRspec
  # uses singleton pattern to allow the use of the same instance of the class
  class Main
    include Singleton
    include ReverseCoverage

    attr_reader :coverage_matrix
    attr_accessor :config, :output_path

    def add(example)
      coverage_result = Coverage.peek_result
      example_data = slice_attributes(example.metadata, *example_attributes)
      example_data[:example_ref] = example_data.hash
      current_state = select_project_files(coverage_result)
      all_changed_files = changed_lines(@last_state, current_state)
      current_test_file = example.metadata[:file_path]
      all_changed_files.each do |file_path|
        save_changes(coverage_matrix, file_path, current_test_file)
      end

      reset_last_state
    end

    def example_attributes
      %I[description full_description file_path line_number scoped_id type]
    end

    def initialize
      @config = {
        file_filter: ->(file_path) { file_of_project?(file_path, '/spec') }
      }
      @output_path = 'tmp'
    end

    def reset_last_state(result = Coverage.peek_result)
      @last_state = select_project_files(result)
    end

    def start
      @coverage_matrix = {}
      reset_last_state
    end

    def save_results
      Coverage.result
      results_to_file(@coverage_matrix)
    end

    class << self
      def method_missing(method, *args, &block)
        instance.respond_to?(method) ? instance.send(method, *args, &block) : super
      end

      def respond_to_missing?(method, include_private = false)
        instance.respond_to?(method) || super
      end
    end
  end
end

# mini-test support
module ReverseCoverageMinitest
  def before_setup
    super
    test_file = method(name).source_location.first
    Main.add(test_file)
  end

  # uses singleton pattern to allow the use of the same instance of the class
  class Main
    include Singleton
    include ReverseCoverage

    attr_reader :coverage_matrix
    attr_accessor :config, :output_path

    def add(test_filename)
      if @old_test_filename.nil?
        @old_test_filename = test_filename
        return
      end
      return unless @old_test_filename != test_filename

      print "processing complete test filename: #{@old_test_filename}"
      @old_test_filename = test_filename

      coverage_result = Coverage.peek_result
      current_state = select_project_files(coverage_result)
      all_changed_files = changed_lines(@last_state, current_state)

      all_changed_files.each do |file_path|
        save_changes(coverage_matrix, file_path, @old_test_filename)
      end

      reset_last_state(coverage_result)

      puts " --  resetting for new test filename: #{test_filename}\n"
    end

    def initialize
      @config = {
        file_filter: ->(file_path) { file_of_project?(file_path, '/test') }
      }
      @output_path = OUTPUT_PATH
    end

    def reset_last_state(result = Coverage.peek_result)
      @last_state = select_project_files(result)
    end

    def start
      @coverage_matrix = {}
      reset_last_state
    end

    def save_results
      puts "finishing old test filename: #{@old_test_filename}"
      coverage_result = Coverage.peek_result
      current_state = select_project_files(coverage_result)
      all_changed_files = changed_lines(@last_state, current_state)

      all_changed_files.each do |file_path, lines|
        # if lines array contains any non-zero values, then save the changes and move to the next file
        non_nil_lines = lines.any? { |changed| !changed.nil? && !changed.zero? }
        # break loop if there are no changes, or if the test_filename is already in the coverage_matrix
        if !non_nil_lines || (coverage_matrix.key?(file_path) && coverage_matrix[file_path].include?(@old_test_filename))
          next
        end

        save_changes(coverage_matrix, file_path, @old_test_filename)
      end

      Coverage.result
      results_to_file(@coverage_matrix)
    end

    class << self
      def method_missing(method, *args, &block)
        instance.respond_to?(method) ? instance.send(method, *args, &block) : super
      end

      def respond_to_missing?(method, include_private = false)
        instance.respond_to?(method) || super
      end
    end
  end
end

# helper methods
module ReverseCoverage
  OUTPUT_FILE_NAME = 'reverse_coverage.json'
  OUTPUT_CSV_FILE_NAME = 'reverse_coverage.csv'
  OUTPUT_PATH = 'tmp'

  def save_changes(hash, file_path, test_information)
    hash[file_path] ||= []
    hash[file_path] << test_information
  end

  def slice_attributes(hash, *keys)
    keys.each_with_object({}) { |k, new_hash| new_hash[k] = hash[k] if hash.key?(k) }
  end

  def changed_lines(prev_state, current_state)
    # create a hash of changed files
    files = []
    prev_state.merge(current_state) do |file_path, prev_lines, current_lines|
      files << file_path if prev_lines != current_lines
    end
    files
  end

  def select_project_files(coverage_result)
    coverage_result.select { |file_path, _lines| @config[:file_filter].call(file_path) }
  end

  def file_of_project?(file_path, test_root)
    file_path.start_with?(Dir.pwd) && !file_path.start_with?(Dir.pwd + test_root)
  end

  def results_to_file(coverage_matrix)
    FileUtils.mkdir_p(OUTPUT_PATH)
    csv_file = File.join(OUTPUT_PATH, OUTPUT_CSV_FILE_NAME)
    json_file = File.join(OUTPUT_PATH, OUTPUT_FILE_NAME)
    # remove the csv + json files if they already exist
    File.delete(csv_file) if File.exist?(csv_file) 
    File.delete(json_file) if File.exist?(json_file)
    # get the working directory
    working_directory = Dir.pwd
    counter = 0
    # iterate through coverage_matrix creating json call graph and csv file of hashed path.
    coverage_matrix.each do |file_path, test_files|
      sanitized_file_path = sanitize_file_path(working_directory, file_path)
      # convert file_path to hash
      hashed_path = path_to_hash(sanitized_file_path)
      # iterate through test_files
      test_files.each do |test_file|
        sanitized_test_file = sanitize_file_path(working_directory, test_file)
        counter += 1
        # convert sanitized_test_file to hash
        hashed_test_file = path_to_hash(sanitized_test_file)
        # write to csv file
        File.open(csv_file, 'a') { |f| f.puts "#{hashed_path},#{hashed_test_file}" }
        # build json call graph block
        block = "#{counter} {\"test\": {\"id\": #{hashed_test_file}, \"file\": \"#{sanitized_test_file}\"}, \"source\": { \"id\": #{hashed_path}, \"file\": \"#{sanitized_file_path}\" }}" # rubocop:disable Layout/LineLength
        # write the block to the json file
        File.open(json_file, 'a') { |f| f.puts block }
      end
    end
  end

  def path_to_hash(path)
    # convert the path to a hash
    Digest::SHA1.hexdigest(path).to_i(16) % (2**31)
  end

  def sanitize_file_path(working_directory, path)
    # remove the working directory from the path
    path = path.gsub(working_directory, '')
    # if the path starts with a / add a . to the beginning
    path.start_with?('/') ? ".#{path}" : path
  end
end
