# frozen_string_literal: true

module RubyMethodsKeywordArguments
  class << self
    def convert_temp(temperature, input_scale:, output_scale: 'celsius')
      if input_scale == 'celsius' && output_scale == 'fahrenheit' 
        c_to_f(temperature)
      elsif input_scale == 'celsius' && output_scale == 'kelvin'
        c_to_k(temperature)
      elsif input_scale == 'fahrenheit' && output_scale == 'celsius'
        f_to_c(temperature)
      elsif input_scale == 'fahrenheit' && output_scale == 'kelvin'
        f_to_k(temperature)
      elsif input_scale == 'kelvin' && output_scale == 'celsius'
        k_to_c(temperature)
      elsif input_scale == 'kelvin' && output_scale == 'fahrenheit'
        k_to_f(temperature)
      else
        0
      end
    end

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
