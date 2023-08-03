require "minitest/autorun"
require "reverse_coverage" if ENV["INTEL"]

module Minitest
  class Test
    if ENV["INTEL"]
      include ReverseCoverageMinitest
      ReverseCoverageMinitest::Main.start
    end
  end
  
  Minitest.after_run do
    if ENV["INTEL"]
      ReverseCoverageMinitest::Main.save_results
    end
  end
end