# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CountingValleys do
  describe '.execute' do
    shared_examples 'expected result' do
      subject { described_class.execute(steps, path) }

      it { is_expected.to eq(expected_result) }
    end

    context 'when steps=8 path=UDDDUDUU' do
      let(:steps) { 8 }
      let(:path) { 'UDDDUDUU' }
      let(:expected_result) { 1 }

      include_examples 'expected result'
    end
  end
end
