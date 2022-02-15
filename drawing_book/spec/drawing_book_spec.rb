# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DrawingBook do
  shared_examples 'expected result' do
    subject { described_class.page_count(number_of_pages, page_number_to_turn_on) }

    it { is_expected.to eq(expected_result) }
  end

  context 'when number_of_pages=6, page_number_to_turn_on=2' do
    let(:number_of_pages) { 6 }
    let(:page_number_to_turn_on) { 2 }
    let(:expected_result) { 1 }

    include_examples 'expected result'
  end

  context 'when number_of_pages=5, page_number_to_turn_on=4' do
    let(:number_of_pages) { 5 }
    let(:page_number_to_turn_on) { 4 }
    let(:expected_result) { 0 }

    include_examples 'expected result'
  end
end
