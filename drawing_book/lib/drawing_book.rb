# frozen_string_literal: true

require 'opentelemetry-sdk'
require 'opentelemetry-exporter-jaeger'
require 'opentelemetry-instrumentation-all'

# This is the main namespace for DrawingBook.
#
# It provides the page_count method.
module DrawingBook
  class << self
    def page_count(number_of_pages, page_number_to_turn_on)
      tracer = OpenTelemetry.tracer_provider.tracer

      tracer.in_span('page_count') do |span|
        span.add_attributes(
          'number_of_pages' => number_of_pages.to_s,
          'page_number_to_turn_on' => page_number_to_turn_on.to_s
        )

        front = {}

        (1..number_of_pages).each do |i|
          front[i] = i / 2
        end

        back = {}

        x = number_of_pages.even? ? 1 : 0

        number_of_pages.downto(1).each do |i|
          back[i] = x / 2
          x += 1
        end

        result = front[page_number_to_turn_on] < back[page_number_to_turn_on] ? front[page_number_to_turn_on] : back[page_number_to_turn_on]

        span.add_attributes(
          'result' => result.to_s
        )

        result
      end
    end
  end
end
