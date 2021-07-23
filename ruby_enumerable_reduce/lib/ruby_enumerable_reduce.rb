# frozen_string_literal: true

module RubyEnumerableReduce
  class << self
    def execute(n)
      (1..n).inject(0) { |acc, i| acc + i * i + 1 }
    end
  end
end
