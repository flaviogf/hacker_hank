# frozen_string_literal: true

RSpec.describe DivisibleSumPairs do
  describe '.execute' do
    shared_examples 'expected pairs' do
      subject { described_class.execute(n, k, ar) }

      it { is_expected.to eq (expected_result) }
    end

    context 'when n=6, k=5, ar=[1,2,3,4,5,6]' do
      let(:n) { 6 }
      let(:k) { 5 }
      let(:ar) { [1, 2, 3, 4, 5, 6] }
      let(:expected_result) { 3 }

      include_examples 'expected pairs'
    end

    context 'when n=6, k=3, ar=[1,3,2,6,1,2]' do
      let(:n) { 6 }
      let(:k) { 3 }
      let(:ar) { [1, 3, 2, 6, 1, 2] }
      let(:expected_result) { 5 }

      include_examples 'expected pairs'
    end
  end
end
