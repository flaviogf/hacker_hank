# frozen_string_literal: true

RSpec.describe RubyLazyEvaluation do
  describe 'Integer#prime?' do
    context 'when check if 1 is prime' do
      subject do
        1.prime?
      end

      it { is_expected.to be false }
    end

    context 'when check if 2 is prime' do
      subject do
        2.prime?
      end

      it { is_expected.to be true }
    end

    context 'when check if 5 is prime' do
      subject do
        5.prime?
      end

      it { is_expected.to be true }
    end
  end

  describe 'Integer#palindromic?' do
    context 'when check if 1 is palindromic' do
      subject do
        1.palindromic?
      end

      it { is_expected.to be true }
    end

    context 'when check if 10 is palindromic' do
      subject do
        10.palindromic?
      end

      it { is_expected.to be false }
    end
  end
end
