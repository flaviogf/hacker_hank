# frozen_string_literal: true

# This is the CountingValleys main namespace
module CountingValleys
  class << self
    def execute(steps, path)
      counter = 0
      level = 0
      flag = false

      (0...steps).each do |i|
        step = path[i]

        incr = step == 'U' ? +1 : -1

        level += incr

        if level == 0
          flag = false
        end

        if level == -1 && !flag
          counter += 1
          flag = true
        end
      end

      counter
    end
  end
end
