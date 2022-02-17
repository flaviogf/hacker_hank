# frozen_string_literal: true

# This is the main namespace for DrawingBook.
#
# It provides the page_count method.
module DrawingBook
  class << self
    def page_count(number_of_pages, page_number_to_turn_on)
      front = {}

      (1..number_of_pages).each do |i|
        front[i] = i / 2
      end

      back = {}

      x = 0

      number_of_pages.downto(1).each do |i|
        back[i] = x / 2
        x += 1
      end

      front[page_number_to_turn_on] < back[page_number_to_turn_on] ? front[page_number_to_turn_on] : back[page_number_to_turn_on]
    end
  end
end
