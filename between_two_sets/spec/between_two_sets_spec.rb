# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BetweenTwoSets do
  describe '.get_total_x' do
    context 'when pass [2, 6] and [24, 36]' do
      let(:a) do
        [2, 6]
      end

      let(:b) do
        [24, 36]
      end

      subject do
        BetweenTwoSets.get_total_x a, b
      end

      it { is_expected.to eq(2) }
    end

    context 'when pass [2, 4] and [16, 32, 96]' do
      let(:a) do
        [2, 4]
      end

      let(:b) do
        [16, 32, 96]
      end

      subject do
        BetweenTwoSets.get_total_x a, b
      end

      it { is_expected.to eq(3) }
    end
  end
end
