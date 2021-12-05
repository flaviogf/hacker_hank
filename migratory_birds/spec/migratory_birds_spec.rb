# frozen_string_literal: true

RSpec.describe MigratoryBirds do
  describe '.execute' do
    shared_examples 'expected result' do
      subject(:result) { described_class.execute(arr) }

      it { is_expected.to eq(expected_result) }
    end

    context 'when arr=[1, 4, 4, 4, 5, 3]' do
      let(:arr) { [1, 4, 4, 4, 5, 3] }
      let(:expected_result) { 4 }

      include_examples 'expected result'
    end

    context 'when arr=[1, 2, 3, 4, 5, 4, 3, 2, 1, 3, 4]' do
      let(:arr) { [1, 2, 3, 4, 5, 4, 3, 2, 1, 3, 4] }
      let(:expected_result) { 3 }

      include_examples 'expected result'
    end
  end
end
