# frozen_string_literal: true

module DivisibleSumPairs
  module_function

  def execute(n, k, ar)
    number_of_pairs = 0

    n.times do |i|
      n.times do |j|
        number_of_pairs += 1 if i < j && (ar[i] + ar[j]) % k == 0
      end
    end

    number_of_pairs
  end
end
