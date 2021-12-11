# frozen_string_literal: true

module BillDivision
  class << self
    def execute(bill, k, b)
      sum = 0

      bill.each_index do |i|
        next if i == k

        sum += bill[i]
      end

      result = b - sum / 2

      result.zero? ? 'Bon Appetit' : String(result)
    end
  end
end
