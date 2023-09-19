require "reverse_coverage"  if ENV['INTEL']

RSpec.configure do |config|
  if ENV['INTEL']
    config.before(:suite) do
      ReverseCoverageRspec::Main.start
    end

    config.around do |e|
      e.run
      ReverseCoverageRspec::Main.add(e)
    end

    config.after(:suite) do
      ReverseCoverageRspec::Main.save_results(ENV['INTEL_OUTPUT_PATH'] || 'tmp')
    end
  end
end