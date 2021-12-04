# frozen_string_literal: true

RSpec.describe DivisibleSumPairs do
  describe '.execute' do
    subject { described_class.execute(n, k, ar) }

    let(:n) { 6 }
    let(:k) { 5 }
    let(:ar) { [1, 2, 3, 4, 5, 6] }
    let(:expected_result) { 5 }

    it { is_expected.to eq (expected_result) }
  end
end
