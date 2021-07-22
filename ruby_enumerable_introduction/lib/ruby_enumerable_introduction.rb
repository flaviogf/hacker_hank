# frozen_string_literal: true

module RubyEnumerableIntroduction
  module_function

  def execute(colors)
    result = []

    colors.each { |it| result << it }

    result
  end
end
