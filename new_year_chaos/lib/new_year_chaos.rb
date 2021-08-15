# frozen_string_literal: true

module NewYearChaos
  module_function

  def minimum_bribes(queue)
    bribe = 0

    queue.each_with_index do |number, index|
      expected = index + 1

      current_bribe = queue[expected...].count { |x| x < number }

      return 'Too chaotic' if current_bribe > 2

      bribe += current_bribe
    end

    bribe
  end
end
