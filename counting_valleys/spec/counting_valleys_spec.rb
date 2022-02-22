# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CountingValleys do
  describe '.execute' do
    subject { described_class.execute(steps, path) }

    let(:steps) { 8 }
    let(:path) { 'UDDDUDUU' }
    let(:expected_result) { 1 }

    it { is_expected.to eq(expected_result) }
  end
end
