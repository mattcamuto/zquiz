module Utilities
  class DoubleLinkList

    attr_accessor :tail, :head

    # Allow one starter node
    def initialize(node = nil)
      ensure_head_and_tail_if_both_nil(node)
    end

    def push_head(node)
      # use case for one node
      ensure_head_and_tail_if_both_nil(node)
      return node if self.head == node

      head.left = node
      node.right = head
      node.left = nil
      self.head = node
    end

    def push_tail(node)
      ensure_head_and_tail_if_both_nil(node)
      return node if self.tail == node

      tail.right = node
      node.left = tail
      node.right = nil
      self.tail = node
    end

    def ensure_head_and_tail_if_both_nil(node)
      if tail.nil? && head.nil?
        self.tail = node
        self.head = node
      end
    end

    def pop_head
      return nil if head.nil?

      popped = head
      self.head = popped.right
      self.head.left = nil

      popped.left = nil
      popped.right = nil
      popped
    end

    def pop_tail
      return nil if tail.nil?

      popped = tail

      self.tail = popped.left
      self.tail.right = nil

      popped.left = nil
      popped.right = nil
      popped
    end

    def delete_node(node)
      return nil if node.nil?

      if head == node && tail == node # one elem
        self.head = nil
        self.tail = nil
      elsif node == head # it is the head
        self.pop_head
        return node
      elsif node == tail # it is the tail
        self.pop_tail
      else
        l = node.left
        r = node.right

        l.right = r
        r.left = l
      end

      node.left = nil
      node.right = nil

      node
    end

    def promote_to_head(node)
      return if head == node
      delete_node(node)
      push_head(node)
    end

    def data_values_tail_to_head
      ret = []
      curr = tail
      while !curr.nil?
        ret << curr.data
        curr = curr.left
      end
      ret
    end

  end
end