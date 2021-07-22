# frozen_string_literal: true

module RubyEnumerableEachWithIndex
  class << self
    def execute(animals, skip)
      result = []

      animals[skip..-1].each_with_index { |it, index| result << "#{index + skip}:#{it}" }

      result
    end
  end
end
