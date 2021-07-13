# frozen_string_literal: true

module BreakingTheRecords
  class << self
    def execute(scores)
      least_points = 0
      most_points = 0

      min = scores[0]
      max = scores[0]

      scores.each do |score|
        if min > score
          least_points += 1
          min = score
        elsif max < score
          most_points += 1
          max = score
        end
      end

      [most_points, least_points]
    end
  end
end
