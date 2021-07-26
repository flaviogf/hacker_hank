# frozen_string_literal: true

RSpec.describe RubyMethodsKeywordArguments do
  describe 'c_to_f' do
    subject do
      RubyMethodsKeywordArguments.c_to_f(temperature)
    end

    let(:temperature) do
      10.0
    end

    it { is_expected.to eq(50.0) }
  end

  describe 'c_to_k' do
    subject do
      RubyMethodsKeywordArguments.c_to_k(temperature)
    end

    let(:temperature) do
      10.0
    end

    it { is_expected.to eq(283.15) }
  end
end
