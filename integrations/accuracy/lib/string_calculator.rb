class StringCalculator
  def self.add(input)
    if input.size == 0
      0
    else
      numbers = input.split(",").map { |num| num.to_i }
      numbers.inject(0) { |sum, number| sum + number.to_i }
    end
  end

  def self.indirect(input)
    add(input)
  end

  def self.never_called
    1
  end
end
