# frozen_string_literal: true

RSpec.describe ClimbingTheLeaderBoard do
  describe '.execute' do
    context 'when pass ranked [100, 90, 90, 80, 75, 60] and player [50, 65, 77, 90, 102]' do
      subject do
        ClimbingTheLeaderBoard.execute(ranked, player)
      end

      let(:ranked) do
        [100, 90, 90, 80, 75, 60]
      end

      let(:player) do
        [50, 65, 77, 90, 102]
      end

      it { is_expected.to eq([6, 5, 4, 2, 1]) }
    end
  end
end
