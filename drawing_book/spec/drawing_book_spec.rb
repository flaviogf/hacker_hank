# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DrawingBook do
  subject { described_class.page_count(number_of_pages, page_number_to_turn_on) }

  let(:number_of_pages) { 6 }
  let(:page_number_to_turn_on) { 2 }
  let(:expected_result) { 1 }

  it { is_expected.to eq(expected_result) }
end
