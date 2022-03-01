# frozen_string_literal: true

# This is the CatsAndAMouse main namespace
module CatsAndAMouse
  class << self
    def execute(cat_a, cat_b, mouse)
      distance_a = (mouse - cat_a).abs
      distance_b = (mouse - cat_b).abs

      return 'Mouse C' if distance_a == distance_b

      distance_a < distance_b ? 'Cat A' : 'Cat B'
    end
  end
end
