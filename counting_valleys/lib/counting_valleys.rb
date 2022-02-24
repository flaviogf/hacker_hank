# frozen_string_literal: true

# This is the CountingValleys main namespace
module CountingValleys
  class << self
    def execute(steps, path)
      counter = 0
      level = 0

      (0...steps).each do |i|
        step = path[i]

        incr = step == 'U' ? +1 : -1

        level += incr

        counter += 1 if level == -1 && step == 'D'
      end

      counter
    end
  end
end
