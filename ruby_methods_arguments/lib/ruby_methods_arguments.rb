# frozen_string_literal: true

module RubyMethodsArguments
  class << self
    def execute(args, skip)
      args[skip..-1]
    end
  end
end
