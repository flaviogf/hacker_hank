# frozen_string_literal: true

module MigratoryBirds
  module_function

  def execute(arr)
    most_frequently = arr[0]
    counter = {}

    arr.each do |bird|
      counter[bird] ||= 0
      counter[bird] += 1

      most_frequently = bird if counter[most_frequently] < counter[bird]

      next unless counter[most_frequently] == counter[bird]

      most_frequently = bird if most_frequently > bird
    end

    most_frequently
  end
end
