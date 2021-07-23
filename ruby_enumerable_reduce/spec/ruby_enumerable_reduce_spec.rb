# frozen_string_literal: true

RSpec.describe RubyEnumerableReduce do
  describe '.execute' do
    subject do
      RubyEnumerableReduce.execute(n)
    end

    let(:n) do
      25
    end

    it { is_expected.to eq(5550) }
  end
end
