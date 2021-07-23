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

  describe '.func_all' do
    subject do
      RubyEnumerablesAnyAllNoneFind.func_all(hash)
    end

    context 'when all values are Integers and are > 10' do
      let(:hash) do
        {
          one: 11,
          two: 12
        }
      end

      it { is_expected.to be true }
    end

    context 'when not all values are Integers' do
      let(:hash) do
        {
          one: 'one',
          two: 2
        }
      end

      it { is_expected.to be false }
    end

    context 'when not all values are > 10' do
      let(:hash) do
        {
          one: 1,
          two: 12
        }
      end

      it { is_expected.to be false }
    end
  end

  describe '.func_none' do
    subject do
      RubyEnumerablesAnyAllNoneFind.func_none(hash)
    end

    context 'when all values are not nil' do
      let(:hash) do
        {
          one: 10,
          two: 'two'
        }
      end

      it { is_expected.to be true }
    end

    context 'when at least one value is nil' do
      let(:hash) do
        {
          one: nil,
          two: 2
        }
      end

      it { is_expected.to be false }
    end
  end
end
