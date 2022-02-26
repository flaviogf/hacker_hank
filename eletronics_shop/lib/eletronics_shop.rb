# frozen_string_literal: true

# This is the EletronicsShop main namespace
module EletronicsShop
  class << self
    def get_money_spent(keyboards, drivers, budget)
      result = -1

      keyboards.each do |k|
        drivers.each do |d|
          sum = k + d

          result = sum if sum <= budget && result < sum
        end
      end

      result
    end
  end
end
