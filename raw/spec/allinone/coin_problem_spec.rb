require 'spec_helper'

BIG = 99_999_999
# COUNTER = 0
FO = {count: 0 }
ACC = {}

def optimal_count(current, coin_possibilities: [], depth: 0)
  puts [current,depth].inspect

  FO[:count] += 1

  puts ACC.inspect

  return BIG if depth > 10

  return ACC[current] if ACC[current]

  if current < 0
    return BIG
  end

  if current == 0
    return 0
  end
  best = BIG
  choices = coin_possibilities.map do |value|
    optimal_count(current - value,coin_possibilities: coin_possibilities, depth: depth + 1) + 1
  end + [best]

  best = choices.min

  ACC[current] = best


  best
end

RSpec.describe 'coin problem' do

  # pending 'build a heap. baby'

  let(:coins) { [1, 3, 4] }

  it 'is end of current is 0 ' do
    expect(optimal_count(0)).to eq (0)
  end

  it 'is end of current is 0 ' do
    expect(optimal_count(-1)).to eq (BIG)
  end


  it 'will find an optimal with recursion' do
    expect(optimal_count(10, coin_possibilities: coins)).to eq (3)
    expect(FO[:count]).to be_between(0,40)
  end

end