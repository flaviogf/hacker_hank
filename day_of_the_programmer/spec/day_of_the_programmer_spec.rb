# frozen_string_literal: true

RSpec.describe DayOfTheProgrammer do
  describe '.execute' do
    shared_examples 'expected date' do
      subject(:result) { described_class.execute(year) }

      it { is_expected.to eq(expected_date) }
    end

    context 'when year is 2017' do
      let(:year) { 2017 }
      let(:expected_date) { '13.09.2017' }

      include_examples 'expected date'
    end

    context 'when year is 2016' do
      let(:year) { 2016 }
      let(:expected_date) { '12.09.2016' }

      include_examples 'expected date'
    end
  end
end
