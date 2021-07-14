# frozen_string_literal: true

RSpec.describe ClimbingTheLeaderBoard do
  describe '.execute' do
    context 'when pass scores [100, 90, 90, 80, 75, 60] and players [50, 65, 77, 90, 102]' do
      subject do
        ClimbingTheLeaderBoard.execute(scores, players)
      end

      let(:scores) do
        [100, 90, 90, 80, 75, 60]
      end

      let(:players) do
        [50, 65, 77, 90, 102]
      end

      it { is_expected.to eq([6, 5, 4, 2, 1]) }
    end
  end
end
