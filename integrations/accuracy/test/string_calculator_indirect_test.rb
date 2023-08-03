require 'test_helper'
require "string_calculator"
class StringCalculatorIndirectTest < Minitest::Test    
  def test_indirect_given2_4
    assert_equal 6, StringCalculator.indirect("2,4")
  end
end