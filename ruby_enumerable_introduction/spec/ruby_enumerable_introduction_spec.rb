# frozen_string_literal: true

RSpec.describe RubyEnumerableIntroduction do
  describe '.execute' do
    subject do
      RubyEnumerableIntroduction.execute(colors)
    end

    let(:colors) do
      %i[black white]
    end

    it { is_expected.not_to equal(colors) }

    it { is_expected.to eql(colors) }
  end
end
