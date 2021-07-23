# frozen_string_literal: true

RSpec.describe RubyEnumerablesAnyAllNoneFind do
  describe '.func_any' do
    subject do
      RubyEnumerablesAnyAllNoneFind.func_any(hash)
    end

    context 'when one key at least is integer' do
      let(:hash) do
        {
          1 => true,
          :two => true
        }
      end

      it { is_expected.to be true }
    end

    context 'when all keys are integer' do
      let(:hash) do
        {
          1 => true,
          2 => true
        }
      end

      it { is_expected.to be true }
    end

    context 'when all keys are not integer' do
      let(:hash) do
        {
          one: true,
          two: true
        }
      end

      it { is_expected.to be false }
    end
  end
end
