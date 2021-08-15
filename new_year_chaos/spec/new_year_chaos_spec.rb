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
  end
end
