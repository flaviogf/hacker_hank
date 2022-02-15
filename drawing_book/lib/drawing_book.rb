# frozen_string_literal: true

# This is the main namespace for DrawingBook.
#
# It provides the page_count method.
module DrawingBook
  class << self
    def page_count(number_of_pages, page_number_to_turn_on)
      counter = 0

      (1...number_of_pages).each do |i|
        break if i == page_number_to_turn_on

        counter += 1
      end

      counter
    end
  end
end
