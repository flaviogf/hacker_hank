# frozen_string_literal: true

require 'pry'

module ClimbingTheLeaderBoard
  class << self
    def execute(ranked, player)
      positions = Array.new(ranked.size)

      position = 1

      ranked.each_with_index do |_, i|
        position += 1 if ranked[i] < ranked[i - 1]
        positions[i] = position
      end

      indexes = Array.new(player.size)

      player.each_with_index do |p, i|
        index = ranked.bsearch_index { |x| x <= p }
        indexes[i] = index ? positions[index] : positions.last + 1
      end

      indexes
    end
  end
end
