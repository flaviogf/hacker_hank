# frozen_string_literal: true

require 'pry'

module ClimbingTheLeaderBoard
  class << self
    def execute(ranked, player)
      positions = Array.new(ranked.size) { 1 }

      position = 1

      ranked.each_with_index do |_, i|
        position += 1 if ranked[i] < ranked[i - 1]
        positions[i] = position
      end

      result = []

      for i in 0...player.size
        position = positions.last + 1
        for j in 0...ranked.size
          if player[i] >= ranked[j]
            position = positions[j]
            break
          end
        end
        result << position
      end

      result
    end
  end
end
