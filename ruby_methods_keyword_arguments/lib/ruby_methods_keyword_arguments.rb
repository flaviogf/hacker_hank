# frozen_string_literal: true

module RubyMethodsKeywordArguments
  class << self
    def c_to_f(temperature)
      temperature * 9.0 / 5.0 + 32.0
    end

    def c_to_k(temperature)
      temperature + 273.15
    end
  end
end
