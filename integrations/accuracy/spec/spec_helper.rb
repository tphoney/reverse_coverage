require "reverse_coverage"  if ENV['INTEL']

RSpec.configure do |config|
  if ENV['INTEL']
    config.before(:suite) do
      ReverseCoverageRspec::Main.start
    end

    config.around do |e|
      e.run
      ReverseCoverageRspec::Main.add(e, config.world.example_group_counts_by_spec_file[e.metadata[:absolute_file_path]])
    end

    config.after(:suite) do
      ReverseCoverageRspec::Main.save_results
    end
  end
end