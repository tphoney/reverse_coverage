require 'spec_helper'
require "string_calculator"

describe StringCalculator do  
  describe ".indirect" do
    context "given '2,4'" do
      it "returns 6" do
        expect(StringCalculator.indirect("2,4")).to eql(6)
      end
    end
  end
end
