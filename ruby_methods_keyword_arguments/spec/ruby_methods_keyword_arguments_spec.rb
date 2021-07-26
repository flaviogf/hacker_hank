# frozen_string_literal: true

RSpec.describe RubyMethodsKeywordArguments do
  describe '.c_to_f' do
    subject do
      RubyMethodsKeywordArguments.c_to_f(temperature)
    end

    let(:temperature) do
      10.0
    end

    it { is_expected.to eq(50.0) }
  end

  describe '.c_to_k' do
    subject do
      RubyMethodsKeywordArguments.c_to_k(temperature)
    end

    let(:temperature) do
      10.0
    end

    it { is_expected.to eq(283.15) }
  end

  describe '.f_to_c' do
    subject do
      RubyMethodsKeywordArguments.f_to_c(temperature)
    end

    let(:temperature) do
      10.0
    end

    it { is_expected.to be_within(0.1).of(-12.22) }
  end

  describe '.f_to_k' do
    subject do
      RubyMethodsKeywordArguments.f_to_k(temperature)
    end

    let(:temperature) do
      10.0
    end

    it { is_expected.to be_within(0.1).of(260.928) }
  end
end
