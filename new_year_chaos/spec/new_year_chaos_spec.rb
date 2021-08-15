# frozen_string_literal: true

RSpec.describe NewYearChaos do
  describe '.minimum_bribes' do
    context 'when pass [1, 2, 3, 5, 4, 6, 7, 8]' do
      subject do
        NewYearChaos.minimum_bribes(queue)
      end

      let(:queue) do
        [1, 2, 3, 5, 4, 6, 7, 8]
      end

      it { is_expected.to eq(1) }
    end

    context 'when pass [4, 1, 2, 3]' do
      subject do
        NewYearChaos.minimum_bribes(queue)
      end

      let(:queue) do
        [4, 1, 2, 3]
      end

      it { is_expected.to eq('Too chaotic') }
    end

    context 'when pass [1, 2, 5, 3, 7, 8, 6, 4]' do
      subject do
        NewYearChaos.minimum_bribes(queue)
      end

      let(:queue) do
        [1, 2, 5, 3, 7, 8, 6, 4]
      end

      it { is_expected.to eq(7) }
    end
  end
end
