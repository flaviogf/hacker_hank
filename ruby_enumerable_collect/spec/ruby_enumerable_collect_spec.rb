# frozen_string_literal: true

RSpec.describe RubyEnumerableCollect do
  describe '.execute' do
    subject do
      RubyEnumerableCollect.execute(secret_message)
    end

    let(:secret_message) do
      'Jul qvq gur puvpxra pebff gur ebnq?'
    end

    it { is_expected.to eq('To get to the other side!') }
  end
end
