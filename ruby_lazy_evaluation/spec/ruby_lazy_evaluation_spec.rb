# frozen_string_literal: true

RSpec.describe RubyLazyEvaluation do
  describe 'Interger#prime?' do
    context 'when check if 1 is prime' do
      subject do
        1.prime?
      end

      it { is_expected.to be false }
    end

    context 'when check if 5 is prime' do
      subject do
        5.prime?
      end

      it { is_expected.to be true }
    end
  end
end
