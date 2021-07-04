# frozen_string_literal: true

require 'spec_helper'
require 'number_line_jumps'

RSpec.describe NumberLineJumps do
  describe '.kangaroo' do
    context 'when both kangaroo reach at the same location at the same time' do
      subject do
        [
          NumberLineJumps.kangaroo(0, 3, 4, 2)
        ]
      end

      it { is_expected.to all(eq 'YES') }
    end

    context 'when both kangaroo does not react at the same location at the same time' do
      subject do
        [
          NumberLineJumps.kangaroo(0, 2, 5, 3),
          NumberLineJumps.kangaroo(43, 2, 70, 2)
        ]
      end

      it { is_expected.to all(eq 'NO') }
    end
  end
end
