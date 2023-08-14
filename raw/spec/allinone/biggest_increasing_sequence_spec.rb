require 'spec_helper'

# gemfile do
#   source 'https://rubygems.org'
#   gem 'rspec'
# end

def max_sub_sequence_n2(arr)
  best = 0
  last_idx = arr.length - 1
  for i in 0..last_idx do
    sum = 0
    for j in i..last_idx do
      sum += arr[j]
      best = [sum,best].max
    end
  end

  best
end

def max_sub_sequence_n(arr)
  best = sum = 0
  for i in 0..(arr.length - 1) do

    sum = [arr[i],sum+arr[i]].max
    best = [sum,best].max
    puts [sum,best].max
  end

  best
end

# require 'rspec/autorun'

RSpec.describe '#doit' do

  example do
    arr = [ -12, -1, 2, 4, -3, 5, 2, -5, 2]

    aggregate_failures do
      expect(max_sub_sequence_n2(arr)).to eq(10)
      expect(max_sub_sequence_n(arr)).to eq(10)
    end
  end
end