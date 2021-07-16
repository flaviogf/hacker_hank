# frozen_string_literal: true

require 'pry'

module ClimbingTheLeaderBoard
  class << self
    def execute(ranked, player)
      result = []

      player.each do |x|
        position = 0

        counter = 0

        (0...ranked.size).each do |i|
          counter += 1 unless ranked[i - 1] == ranked[i]

          if x == ranked[i] || x > ranked[i]
            position = counter
            break
          end
        end

        position = counter + 1 if position.zero?

        result << position
      end

      result
    end
  end
end
