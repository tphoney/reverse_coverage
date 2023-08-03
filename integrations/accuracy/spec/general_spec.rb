require 'spec_helper'
require "string_calculator"
require "string_joiner"

describe StringCalculator do
  describe ".add" do
    context "given '2,4'" do
      it "returns 6" do
        expect(StringCalculator.add("2,4")).to eql(6)
      end
    end
  end
end

describe StringJoiner do
  describe ".join" do
    context "given ['a','b','c']" do
      it "returns 'a,b,c'" do
        expect(StringJoiner.join(['a','b','c'])).to eql('a,b,c')     
      end
    end
  end
end