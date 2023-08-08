module Utilities
  class Stack

    def initialize
      @stack = []
    end

    def push item
      @stack << item
    end

    def pop
      @stack.pop
    end

    def size
      @stack.size
    end

    def as_array
      @stack.dup
    end

    def peek
      @stack.last
    end
  end
end