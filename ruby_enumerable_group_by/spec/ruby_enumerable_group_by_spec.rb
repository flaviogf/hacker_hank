# frozen_string_literal: true

RSpec.describe RubyEnumerableGroupBy do
  describe '.execute' do
    subject do
      RubyEnumerableGroupBy.execute(marks, pass_marks)
    end

    let(:marks) do
      {
        'Ramesh' => 23,
        'Vivek' => 40,
        'Harsh' => 88,
        'Mohammad' => 60
      }
    end

    let(:pass_marks) do
      30
    end

    let(:answer) do
      {
        'Failed' => [['Ramesh', 23]],
        'Passed' => [['Vivek', 40], ['Harsh', 88], ['Mohammad', 60]]
      }
    end

    it { is_expected.to eq(answer) }
  end
end
