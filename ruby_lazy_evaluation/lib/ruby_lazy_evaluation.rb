# frozen_string_literal: true

module RubyLazyEvaluation
  class << self
    def execute(number)
      1.upto(Float::INFINITY).lazy.select(&:palindromic_prime?).first(number)
    end
  end
end

class Integer
  def prime?
    counter = 0

    (1..self).each do |i|
      counter += 1 if (self % i).zero?
    end

    counter == 2
  end

  def palindromic?
    to_s == to_s.reverse
  end

  def palindromic_prime?
    prime? && palindromic?
  end
end
