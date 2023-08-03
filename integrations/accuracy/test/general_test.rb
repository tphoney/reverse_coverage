require 'test_helper'
require "string_calculator"
require "string_joiner"

class StringCalculatorTest < Minitest::Test    
  def test_given2_4
    assert_equal 6, StringCalculator.add("2,4")
  end
end

class StringJoinerTest < Minitest::Test
  def test_givenABC
    assert_equal 'a,b,c', StringJoiner.join(['a','b','c'])
  end
end