module Utilities
  class LinkNode
    attr_accessor :ptr, :value

    def initialize(value, ptr: nil)
      @value = value
      @ptr = ptr
    end

    def append(value)
      node = self.class.new(value)
      self.ptr = node
      node
    end

    class << self
      def remove(ptr, val: nil)
        return nil if ptr.nil?

        last = nil
        cursor = ptr
        head = ptr

        while !cursor.nil?
          if cursor.value == val
            head = cursor.ptr if last.nil?
            last.ptr = cursor.ptr unless last.nil?
            cursor.ptr = nil
            return cursor, head
          end
          last = cursor
          cursor = cursor.ptr
        end
      end

      def to_array(ptr)
        return [] if ptr.nil?
        cursor = ptr
        [].tap do |arr|
          while !cursor.nil?
            arr << cursor.value
            cursor = cursor.ptr
          end
        end
      end

      # The og college question.
      def reverse(ptr)
        last = nil
        curr = ptr
        nex = curr.ptr
        while !nex.nil?
          nex = curr.ptr
          curr.ptr = last
          last = curr
          curr = nex
        end
        last
      end
    end

  end
end