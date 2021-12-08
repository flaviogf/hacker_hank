# frozen_string_literal: true

module DayOfTheProgrammer
  class << self
    def execute(year)
      day = number_of_days_in_a_year - sum_of_the_days_of_the_months_until_september
      "#{day}.09.#{year}"
    end

    private

    def number_of_days_in_a_year
      256
    end

    def sum_of_the_days_of_the_months_until_september
      243
    end
  end
end
