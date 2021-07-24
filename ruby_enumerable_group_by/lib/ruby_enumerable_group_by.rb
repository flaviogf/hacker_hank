# frozen_string_literal: true

module RubyEnumerableGroupBy
  class << self
    def execute(marks, pass_marks)
      marks.group_by { |_, value| value > pass_marks ? 'Passed' : 'Failed' }
    end
  end
end
