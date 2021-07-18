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

      indexes = []

      player.each do |p|
        i = ranked.bsearch_index { |x| x <= p }
        indexes << i
      end

      indexes.collect { |i| i.nil? ? positions.last + 1 : positions[i] }
    end
  end
end
