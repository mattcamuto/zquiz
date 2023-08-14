require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rspec'
end

def doit
  'return a string'
end

require 'rspec/autorun'

RSpec.describe '#doit' do
  example do
    expect(doit).to be_a(Integer)
  end
end