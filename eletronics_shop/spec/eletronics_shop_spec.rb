# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EletronicsShop do
  describe 'get_money_spent' do
    subject { described_class.get_money_spent(keyboards, drivers, budget) }

    let(:keyboards) { [40, 50, 60] }
    let(:drivers) { [5, 8, 12] }
    let(:budget) { 60 }

    it { is_expected.to eq(58) }
  end
end
