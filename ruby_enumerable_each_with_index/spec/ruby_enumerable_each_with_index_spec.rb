# frozen_string_literal: true

RSpec.describe RubyEnumerableEachWithIndex do
  describe '.execute' do
    subject do
      RubyEnumerableEachWithIndex.execute(animals, skip)
    end

    let(:animals) do
      %w[leopard bear fox wolf]
    end

    let(:skip) do
      2
    end

    it { is_expected.to eq(['2:fox', '3:wolf']) }
  end
end
