require 'spec_helper'

RSpec.describe LruCache do

  it 'can add elements, and report size' do
    cache = LruCache.new(capacity: 4)
    expect(cache.remaining).to eq(4)
    expect(cache.size).to eq(0)

    cache.add_item('foo', :bar)
    cache.add_item('foo', :bar)
    cache.add_item('food', :bard)

    expect(cache.get_item('food')).to eq(:bard)

    expect(cache.remaining).to eq(2)
    expect(cache.size).to eq(2)

    expect(cache.keys).to match_array(['foo', 'food'])
  end

  it 'expires the last one used' do
    cache = LruCache.new(capacity: 3)

    cache.add_item('a', :a)
    cache.add_item('b', :b)
    cache.add_item('c', :c)
    cache.add_item('d', :d)

    expect(cache.keys).to match_array(['b','c', 'd'])


  end


end