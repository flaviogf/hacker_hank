# frozen_string_literal: true

module DayOfTheProgrammer
  class << self
    def execute(year)
      day = number_of_days_in_a_year - sum_of_the_days_of_the_months_until_september(year)
      "#{day}.09.#{year}"
    end

    private

    def number_of_days_in_a_year
      256
    end

    def sum_of_the_days_of_the_months_until_september(year)
      leap?(year) ? 244 : 243
    end

    def leap?(year)
      return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0) if gregorian?(year)

      year % 4 == 0
    end

    def gregorian?(year)
      year >= 1918
    end
  end
end
