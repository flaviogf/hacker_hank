# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CatsAndAMouse do
  describe '.execute' do
    subject { queries.collect { |q| described_class.execute(q[:x], q[:y], q[:z]) } }

    let(:queries) do
      [
        { x: 1, y: 3, z: 3 }
      ]
    end

    let(:expected_results) do
      ['Cat B']
    end

    it { is_expected.to eq(expected_results) }
  end
end
