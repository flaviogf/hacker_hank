# frozen_string_literal: true

module RubyEnumerableIntroduction
  module_function

  def execute(colors)
    colors.collect { |c| c }
  end
end
