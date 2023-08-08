require 'spec_helper'

RSpec.describe Utilities::Stack do
  subject(:stack) { described_class.new }

  describe "all if it" do
    it 'does it all, so simply' do
      aggregate_failures do
        expect(stack.peek).to be_nil
        expect(stack.size).to eq 0
        stack.push(1)
        stack.push(2)
        expect(stack.peek).to eq 2

        expect(stack.as_array).to eq([1, 2])

        expect(stack.size).to eq 2
        expect(stack.pop).to eq(2)
        expect(stack.pop).to eq(1)
        expect(stack.size).to eq 0
      end
    end
  end
end