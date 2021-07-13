# frozen_string_literal: true

RSpec.describe BreakingTheRecords do
  describe '.execute' do
    context 'when pass [10, 5, 20, 20, 4, 5, 2, 25, 1]' do
      let(:scores) do
        [10, 5, 20, 20, 4, 5, 2, 25, 1]
      end

      subject do
        BreakingTheRecords.execute(scores)
      end

      it { is_expected.to eq([2, 4]) }
    end
  end
end
