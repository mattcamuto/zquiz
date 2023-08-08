require "some_module"
require_relative 'utilities/matrix.rb'

class SomeClass
  include SomeModule

  attr_reader :foo

  def initialize
    @foo = :bar
  end

  def matrix
    @matrix ||= Utilities::Matrix.new
  end


end