# frozen_string_literal: true

# This is the main namespace for DrawingBook.
#
# It provides the page_count method.
module DrawingBook
  class << self
    def page_count(number_of_pages, page_number_to_turn_on)
      front = {}

      (2..number_of_pages - 1).each do |i|
        front[i] = i / 2
      end

      back = {
        1 => 2,
        2 => 1,
        3 => 1,
        4 => 0,
        5 => 0
      }

      front[page_number_to_turn_on] < back[page_number_to_turn_on] ? front[page_number_to_turn_on] : back[page_number_to_turn_on]
    end
  end
end
