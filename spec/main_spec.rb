# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ReverseCoverage do
  include described_class
  let(:coverage_result) do
    {
      '/path/to/file.rb' => [1, 0, 1],
      '/path/to/other_file.rb' => [0, 1, 1]
    }
  end

  let(:test_information) { 'RSpec test' }

  describe '#save_changes' do
    it 'adds the test information to the coverage matrix for the given file path' do
      hash = {}
      file_path = '/path/to/file.rb'
      save_changes(hash, file_path, test_information)
      expect(hash).to eq({ file_path => [test_information] })
    end

    it 'appends the test information to the coverage matrix for the given file path if it already exists' do
      hash = { '/path/to/file.rb' => ['Minitest test'] }
      file_path = '/path/to/file.rb'
      save_changes(hash, file_path, test_information)
      expect(hash).to eq({ file_path => ['Minitest test', test_information] })
    end
  end

  describe '#slice_attributes' do
    it 'returns a hash with only the specified keys' do
      hash = { a: 1, b: 2, c: 3 }
      expect(slice_attributes(hash, :a, :c)).to eq({ a: 1, c: 3 })
    end
  end

  describe '#changed_lines' do
    it 'returns an array of the difference between the current and previous state for each line in each file' do
      prev_state = {
        '/path/to/file.rb' => [1, 0, 1],
        '/path/to/other_file.rb' => [0, 1, 1], '/path/no_change.rb' => [0, 1, 1], '/path/empty.rb' => []
      }
      current_state = {
        '/path/to/file.rb' => [1, 1, 1],
        '/path/to/other_file.rb' => [0, 0, 1], '/path/no_change.rb' => [0, 1, 1], '/path/empty.rb' => []
      }
      expect(changed_lines(prev_state, current_state)).to eq(['/path/to/file.rb', '/path/to/other_file.rb'])
    end
  end

  describe '#file_of_project?' do
    it 'returns true if the file path is within the project and not within the test directory' do
      expect(file_of_project?('/path/to/file.rb', '/test')).to be false
      expect(file_of_project?('/path/to/test/file_spec.rb', '/test')).to be false
      expect(file_of_project?('/other/path/to/file.rb', '/test')).to be false
    end
  end

  describe '#path_to_hash' do
    it 'returns a unique integer hash for the given path' do
      expect(path_to_hash('/path/to/file.rb')).to be_a(Integer)
      expect(path_to_hash('/path/to/file.rb')).not_to eq(path_to_hash('/path/to/other_file.rb'))
    end
  end
end
