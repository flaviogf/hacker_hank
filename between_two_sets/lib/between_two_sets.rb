# frozen_string_literal: true

require 'set'

module BetweenTwoSets
  class << self
    def get_total_x(a, b)
      dividends = 1.upto(b.last).to_a

      guesses = Set.new

      dividends.each do |dividend|
        guesses << dividend if a.all? { |divisor| factor?(dividend, divisor) }
      end

      result = Set.new

      guesses.each do |divisor|
        result << divisor if b.all? { |dividend| factor?(dividend, divisor) }
      end

      result.size
    end

    private

    def factor?(dividend, divisor)
      (dividend % divisor).zero?
    end
  end
end
