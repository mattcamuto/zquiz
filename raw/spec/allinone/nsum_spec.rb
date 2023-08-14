require 'spec_helper'


def n2sum_n2(arr, target)
  l = arr.length - 1
  for i in 0..l-1 do
    for j in i..l do
      puts [i,j].inspect
      if arr[i] + arr[j] == target
        return [arr[i], arr[j]]
      end
    end
  end
end

def n2sum_set(arr, target)
  s = Set.new
  l = arr.length - 1
  for i in 0..l-1 do
    node = arr[i]
    diff = target - node
    return [node,diff] if s.include?(diff)
    s.add(node)
  end
end

def n3sum_set_and_n_squared(arr, target)

  s = Set.new
  l = arr.length - 1

  arr.each {|val| s.add(val)}

  for i in 0..l-2 do
    for j in i..l-1 do
      diff = target - (arr[i] + arr[j])
      if s.include?(diff) && diff != arr[i] && diff != arr[j]
        return [arr[i], arr[j], diff]
      end
    end
  end
end

RSpec.describe 'nsum' do

  context '2sum' do
    let(:arr) { [1, 6, 3, 9, 12, 2, 7, 16]}
    it 'works n^2' do
      expect(n2sum_n2(arr,9)).to match_array([6,3])
    end

    it 'works with set' do
      expect(n2sum_set(arr,9)).to match_array([6,3])
    end
  end

  context '3sum' do
    let(:arr) { [1, 6, 4, 9, 10, 12, 2, 7, 16]}

    it 'works' do
      expect(n3sum_set_and_n_squared(arr,10)).to match_array([1,2,7])
    end

  end



end

# unique substrings

