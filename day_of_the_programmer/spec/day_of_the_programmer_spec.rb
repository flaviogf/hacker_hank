# frozen_string_literal: true

RSpec.describe DayOfTheProgrammer do
  describe '.execute' do
    context 'when year is 2017' do
      subject(:result) { described_class.execute(year) }
      let(:year) { 2017 }
      let(:expected_date) { '13.09.2017' }

      it { is_expected.to eq(expected_date) }
    end
  end
end
