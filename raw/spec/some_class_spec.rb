require_relative '../lib/some_class'
require 'spec_helper'

RSpec.describe SomeClass do
  subject(:actore) { SomeClass.new }

  it 'is foo' do
    expect(actore.foo).to eq(:bar)
  end

  it 'is food' do
    expect(actore.food).to eq(:bard)
  end

  it 'loads matrix' do
    expect(actore.matrix.bar).to eq('xxx')
  end

end
