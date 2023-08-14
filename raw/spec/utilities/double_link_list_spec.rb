require 'spec_helper'

RSpec.describe Utilities::DoubleLinkList do

  describe '#head,#tail' do
    it 'is the inital nodes, it built with one' do
      node = Utilities::DoubleLinkNode.new
      dll = Utilities::DoubleLinkList.new(node)
      expect(dll.head).to eq(node)
      expect(dll.tail).to eq(node)
    end

    it 'is nil with nil iniital node' do
      dll = Utilities::DoubleLinkList.new(nil)
      expect(dll.head).to eq(nil)
      expect(dll.tail).to eq(nil)
    end
  end

  context '#push_head,#push_tail' do
    describe '#push_head' do
      it 'adds to head, if nil' do
        node = Utilities::DoubleLinkNode.new
        new_node = Utilities::DoubleLinkNode.new
        dll = Utilities::DoubleLinkList.new(node)
        expect {
          dll.push_head(new_node)
          expect(dll.head.right).to eq(node)
        }.to change { dll.head }.from(node).to(new_node)
      end

      it 'creates head and tail if nil' do
        new_node = Utilities::DoubleLinkNode.new
        dll = Utilities::DoubleLinkList.new(nil)
        expect {
          dll.push_head(new_node)
          expect(dll.head.left).to be nil
          expect(dll.tail).to eq new_node
        }.to change { dll.head }.from(nil).to(new_node)
      end
    end

    describe '#push_tail' do
      it 'adds to head, if present' do
        node = Utilities::DoubleLinkNode.new
        new_node = Utilities::DoubleLinkNode.new
        dll = Utilities::DoubleLinkList.new(node)
        expect {
          dll.push_tail(new_node)
          expect(dll.tail.left).to eq(node)
        }.to change { dll.tail }.from(node).to(new_node)
      end

      it 'adds to tail, if nodes present' do
        new_node = Utilities::DoubleLinkNode.new
        dll = Utilities::DoubleLinkList.new(nil)
        expect {
          dll.push_tail(new_node)
          expect(dll.tail.right).to be nil
          expect(dll.head).to eq new_node
        }.to change { dll.tail }.from(nil).to(new_node)
      end
    end

  end

  describe '#delete' do
    it 'does not fail if nil' do
      dll = Utilities::DoubleLinkList.new(nil)
      deleted = dll.delete_node(nil)
      expect(deleted).to be nil
    end

    it 'deletes with one' do
      a = Utilities::DoubleLinkNode.new(data: 'a')
      dll = Utilities::DoubleLinkList.new(a)
      deleted = dll.delete_node(a)
      expect(deleted).to eq(a)
      expect(dll.tail).to be nil
      expect(dll.head).to be nil
    end

    it 'deletes with two, from head' do
      a = Utilities::DoubleLinkNode.new(data: 'a')
      b = Utilities::DoubleLinkNode.new(data: 'b')
      dll = Utilities::DoubleLinkList.new(a)
      dll.push_head(b)

      deleted = dll.delete_node(a)
      expect(deleted).to eq(a)

      expect(dll.tail).to eq b
      expect(dll.head).to eq b
    end

    it 'deletes with two, from tail' do
      a = Utilities::DoubleLinkNode.new(data: 'a')
      b = Utilities::DoubleLinkNode.new(data: 'b')
      dll = Utilities::DoubleLinkList.new(a)
      dll.push_head(b)

      deleted = dll.delete_node(b)
      expect(deleted).to eq(b)

      expect(dll.tail).to eq a
      expect(dll.head).to eq a
    end


    it 'deletes with more than 2, middle' do
      a = Utilities::DoubleLinkNode.new(data: 'a')
      b = Utilities::DoubleLinkNode.new(data: 'b')
      c = Utilities::DoubleLinkNode.new(data: 'c')
      d = Utilities::DoubleLinkNode.new(data: 'd')

      dll = Utilities::DoubleLinkList.new(a)
      dll.push_head(b)
      dll.push_head(c)
      dll.push_head(d)

      expect(dll.data_values_tail_to_head).to eq(%w(a b c d))

      deleted = dll.delete_node(c)
      expect(deleted).to eq(c)

      expect(dll.data_values_tail_to_head).to eq(%w(a b d))

      expect(dll.tail).to eq a
      expect(dll.head).to eq d
    end
  end

  describe '#promote_to_head' do

    it 'stays still if head' do
      a = Utilities::DoubleLinkNode.new(data: 'a')
      b = Utilities::DoubleLinkNode.new(data: 'b')
      c = Utilities::DoubleLinkNode.new(data: 'c')
      d = Utilities::DoubleLinkNode.new(data: 'd')

      dll = Utilities::DoubleLinkList.new(a)
      dll.push_head(b)
      dll.push_head(c)
      dll.push_head(d)

      dll.promote_to_head(d)
      expect(dll.head).to eq(d)
    end

    it 'promotes to the top spot if in middle' do
      a = Utilities::DoubleLinkNode.new(data: 'a')
      b = Utilities::DoubleLinkNode.new(data: 'b')
      c = Utilities::DoubleLinkNode.new(data: 'c')
      d = Utilities::DoubleLinkNode.new(data: 'd')

      dll = Utilities::DoubleLinkList.new(a)
      dll.push_head(b)
      dll.push_head(c)
      dll.push_head(d)

      dll.promote_to_head(b)
      expect(dll.head).to eq(b)
    end

    it 'promotes to the top spot if tail' do
      a = Utilities::DoubleLinkNode.new(data: 'a')
      b = Utilities::DoubleLinkNode.new(data: 'b')
      c = Utilities::DoubleLinkNode.new(data: 'c')
      d = Utilities::DoubleLinkNode.new(data: 'd')

      dll = Utilities::DoubleLinkList.new(a)
      dll.push_head(b)
      dll.push_head(c)
      dll.push_head(d)

      dll.promote_to_head(a)
      expect(dll.head).to eq(a)
      expect(dll.tail).to eq(b)
    end
  end

  describe '#data_values_tail_to_head' do
    it 'prints the nodes in order' do
      a = Utilities::DoubleLinkNode.new(data: 'a')
      b = Utilities::DoubleLinkNode.new(data: 'b')
      c = Utilities::DoubleLinkNode.new(data: 'c')
      d = Utilities::DoubleLinkNode.new(data: 'd')

      dll = Utilities::DoubleLinkList.new(a)
      dll.push_head(b)
      dll.push_head(c)
      dll.push_head(d)

      expect(dll.data_values_tail_to_head).to eq(%w(a b c d))

      expect(dll.tail.data).to eq('a')
      expect(dll.head.data).to eq('d')

      e = Utilities::DoubleLinkNode.new(data: 'e')
      dll.push_tail(e)
      expect(dll.data_values_tail_to_head).to eq(%w(e a b c d))

      old_head = dll.pop_head

      expect(old_head.left).to be nil
      expect(old_head.right).to be nil

      expect(old_head).to eq(d)
      expect(dll.head).to eq(c)

      old_tail = dll.pop_tail
      expect(old_tail).to eq(e)
      expect(dll.tail).to eq(a)
    end
  end

end