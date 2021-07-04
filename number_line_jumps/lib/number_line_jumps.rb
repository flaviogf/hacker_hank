# frozen_string_literal: true

module NumberLineJumps
  class << self
    def kangaroo(x1, v1, x2, v2)
      return 'NO' if v2 >= v1

      x1 += v1

      x2 += v2

      x = x1 - x2

      return 'NO' if x.positive?

      return 'YES' if x.zero?

      kangaroo(x1, v1, x2, v2)
    end
  end
end
