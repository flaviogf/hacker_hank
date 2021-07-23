# frozen_string_literal: true

module RubyEnumerablesAnyAllNoneFind
  class << self
    def func_any(hash)
      hash.any? { |key, _| key.is_a?(Integer) }
    end

    def func_all(hash)
      hash.all? { |_, value| value.is_a?(Integer) && value > 10 }
    end
  end
end
