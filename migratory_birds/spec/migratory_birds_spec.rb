# frozen_string_literal: true

RSpec.describe MigratoryBirds do
  describe '.execute' do
    context 'when arr=[1, 4, 4, 4, 5, 3]' do
      subject(:result) { described_class.execute(arr) }
      let(:arr) { [1, 4, 4, 4, 5, 3] }
      let(:expected_result) { 4 }

      it { is_expected.to eq(expected_result) }
    end
  end
end
