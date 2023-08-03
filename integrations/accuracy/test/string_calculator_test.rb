require 'test_helper'
require "string_calculator"
class StringCalculatorTest < Minitest::Test    
  def test_given2_4
    assert_equal 6, StringCalculator.add("2,4")
  end
end