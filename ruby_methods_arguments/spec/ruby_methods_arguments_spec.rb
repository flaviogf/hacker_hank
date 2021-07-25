# frozen_string_literal: true

RSpec.describe RubyMethodsArguments do
  describe '.execute' do
    subject do
      RubyMethodsArguments.execute(args, skip)
    end

    let(:args) do
      [1, 2, 3]
    end

    let(:skip) do
      1
    end

    it { is_expected.to eq([2, 3]) }
  end
end
