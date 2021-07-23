# frozen_string_literal: true

module RubyEnumerablesAnyAllNoneFind
  class << self
    def func_any(hash)
      hash.any? { |key, _| key.is_a?(Integer) }
    end
  end
end
