# frozen_string_literal: true
Coverage.start

module ReverseCoverageRspec
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

      all_changed_files.each do |file_path, lines|
        # if lines array contains any non-zero values, then save the changes and move to the next file
        non_nil_lines = lines.any? { |changed| !changed.nil? && !changed.zero? }
        # break loop if there are no changes, or if the current_test_file is already in the coverage_matrix
        next if !non_nil_lines || (coverage_matrix.key?(file_path) && coverage_matrix[file_path].include?(current_test_file))
        save_changes(coverage_matrix, file_path, current_test_file)
      end

      reset_last_state
    end

    def example_attributes
      %I[description full_description file_path line_number scoped_id type]
    end

    def initialize
      @config = {
        file_filter: ->(file_path) { file_of_project?(file_path, "/spec") }
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

    def save_results(file_name: 'reverse_coverage.yml')
      Coverage.result
      results_to_file(@coverage_matrix, "_spec.rb")
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

module ReverseCoverageMinitest
  def after_setup
    super
    testFile = self.method(self.name).source_location.first
    Main.add(testFile)
  end

  class Main
    include Singleton
    include ReverseCoverage

    attr_reader :coverage_matrix
    attr_accessor :config, :output_path

    def add(test_information)
      coverage_result = Coverage.peek_result
      current_state = select_project_files(coverage_result)
      all_changed_files = changed_lines(@last_state, current_state)

      all_changed_files.each do |file_path, lines|
        # if lines array contains any non-zero values, then save the changes and move to the next file
        non_nil_lines = lines.any? { |changed| !changed.nil? && !changed.zero? }
        # break loop if there are no changes, or if the test_information is already in the coverage_matrix
        next if !non_nil_lines || (coverage_matrix.key?(file_path) && coverage_matrix[file_path].include?(test_information))
        save_changes(coverage_matrix, file_path, test_information)
      end

      reset_last_state
    end

    def initialize
      @config = {
        file_filter: ->(file_path) { file_of_project?(file_path, "/test") }
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

    def save_results()
      Coverage.result
      results_to_file(@coverage_matrix, "_test.rb")
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

module ReverseCoverage
  require 'digest/md5'

  OUTPUT_FILE_NAME = 'reverse_coverage.json'
  OUTPUT_CSV_FILE_NAME = 'reverse_coverage.csv'
  OUTPUT_PATH = 'tmp'

  def save_changes(hash, file_path, test_information )
    hash[file_path] ||= []
    hash[file_path] << test_information
  end

  def slice_attributes(hash, *keys)
    keys.each_with_object({}) { |k, new_hash| new_hash[k] = hash[k] if hash.key?(k) }
  end

  def changed_lines(prev_state, current_state)
    prev_state.merge(current_state) do |_file_path, prev_lines, current_lines|
      prev_lines.zip(current_lines).map { |prev, curr| curr.nil? || prev.nil? ? nil : curr - prev }
    end
  end

  def select_project_files(coverage_result)
    coverage_result.select { |file_path, _lines| @config[:file_filter].call(file_path) }
  end

  def file_of_project?(file_path, test_root)
    file_path.start_with?(Dir.pwd) && !file_path.start_with?(Dir.pwd + test_root)
  end

  def results_to_file(coverage_matrix, test_file_suffix)
    FileUtils.mkdir_p(OUTPUT_PATH)
    csv_file = File.join(OUTPUT_PATH, OUTPUT_CSV_FILE_NAME)
    json_file = File.join(OUTPUT_PATH, OUTPUT_FILE_NAME)
    # remove the csv + json files if they already exist
    File.delete(csv_file) if File.exist?(csv_file)
    File.delete(json_file) if File.exist?(json_file)
    counter = 0
    # iterate through coverage_matrix creating json call graph and csv file of hashed path.
    coverage_matrix.each do |file_path, test_files|
      # convert file_path to hash
      hashed_path = path_to_hash(file_path)
      # iterate through test_files
      test_files.each do |test_file|
        counter += 1
        # convert test_file to hash
        hashed_test_file = path_to_hash(test_file)
        # write to csv file
        File.open(csv_file, 'a') { |f| f.puts "#{hashed_path},#{hashed_test_file}" }
        # build json call graph block
        block = "#{counter} {\n"
        block += "  \"test\": {\n"
        block += "    \"id\": #{hashed_test_file},\n"
        block += '    "file": "' + test_file + "\"\n"
        block += "  },\n"
        block += "  \"source\": {\n"
        block += "    \"id\": #{hashed_path},\n"
        block += '    "file": "' + file_path + "\"\n"
        block += "  }\n"
        block += "},"
        # write the block to the json file
        File.open(json_file, 'a') { |f| f.puts block }
      end
    end
    # remove the last comma from the json file
    File.open(json_file, 'rb+') do |f|
      f.seek(-1, IO::SEEK_END)
      f.truncate(f.pos)
    end
  end

  def path_to_hash(path)
    hexstr = Digest::MD5.hexdigest(path)
    return hexstr.to_i(16)
  end
end