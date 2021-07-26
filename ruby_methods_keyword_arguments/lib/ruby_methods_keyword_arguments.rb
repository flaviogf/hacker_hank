# frozen_string_literal: true

module RubyMethodsKeywordArguments
  class << self
    def c_to_f(temperature)
      temperature * 9.0 / 5.0 + 32.0
    end

    def c_to_k(temperature)
      temperature + 273.15
    end

    def f_to_c(temperature)
      (temperature - 32) * 5.0 / 9.0
    end

    def f_to_k(temperature)
      (temperature - 32) * 5.0 / 9.0 + 273.15
    end

    def k_to_c(temperature)
      temperature - 273.15
    end

    def k_to_f(temperature)
      (temperature - 273.15) * 9.0 / 5.0 + 32
    end
  end
end
