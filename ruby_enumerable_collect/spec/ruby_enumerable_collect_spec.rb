# frozen_string_literal: true

RSpec.describe RubyEnumerableCollect do
  describe '.execute' do
    subject do
      RubyEnumerableCollect.execute(secret_messages)
    end

    let(:secret_messages) do
      ['jul qvq gur puvpxra pebff gur ebnq?']
    end

    it { is_expected.to eq(['why did the chicken cross the road?']) }
  end
end
