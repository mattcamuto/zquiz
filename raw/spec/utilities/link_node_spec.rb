require 'spec_helper'

RSpec.describe Utilities::LinkNode do

  def make_list_and_return_root(arr)
    Utilities::LinkNode.new(arr.shift).tap do |curr|
      arr.each { |val| curr = curr.append(val) }
    end
  end

  describe ".to_array" do

    it 'is correct' do
      arr = make_list_and_return_root([1, 2, 3])
      expect(Utilities::LinkNode.to_array(arr)).to eq [1, 2, 3]
    end

    it 'is [] when og is nil' do
      expect(Utilities::LinkNode.to_array(nil)).to eq []
    end

    it 'converts correctly' do
      one = make_list_and_return_root([1, 2, 3])
      expect(Utilities::LinkNode.to_array(one)).to eq [1, 2, 3]
    end
  end

  describe '#remove_node!' do

    context 'with data' do
      it 'removes and respects other elements' do
        one = make_list_and_return_root([1, 2, 3, 7, 4, 7, 9])
        found, head = Utilities::LinkNode.remove(one, val: 7)
        expect(found.value).to eq(7)
        expect(Utilities::LinkNode.to_array(head)).to eq [1, 2, 3, 4, 7, 9]
      end

      it 'removes front when needed' do
        one = make_list_and_return_root([1, 2, 3, 7, 4, 7, 9])
        found, head = Utilities::LinkNode.remove(one, val: 1)
        expect(found.value).to eq(1)
        expect(Utilities::LinkNode.to_array(head)).to eq [2, 3, 7, 4, 7, 9]
      end

      it 'removes end when needed' do
        one = make_list_and_return_root([1, 2, 3, 7, 4, 7, 9])
        found, head = Utilities::LinkNode.remove(one, val: 9)
        expect(found.value).to eq(9)
        expect(Utilities::LinkNode.to_array(head)).to eq [1, 2, 3, 7, 4, 7]
      end


    end

    context 'with nothing' do
      it 'is nil ptr is nil' do
        expect(Utilities::LinkNode.remove(nil)).to be_nil
      end
    end

  end

  describe '.reverse' do
    it 'reverses' do
      one = Utilities::LinkNode.new(1)
      one.append(2).append(3).append(4)
      reverse = Utilities::LinkNode.reverse(one)
      expect(Utilities::LinkNode.to_array(reverse)).to eq [4, 3, 2, 1]
    end
  end

end