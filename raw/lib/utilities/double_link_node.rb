module Utilities
  class DoubleLinkNode
    attr_accessor :left, :right, :data

    def initialize(left: nil, right: nil, data: nil)
      self.left = left
      self.right = right
      self.data = data
    end
  end
end