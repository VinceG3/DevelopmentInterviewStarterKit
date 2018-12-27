require 'spec_helper'
require 'json'
require_relative '../../lib/freq_counter'

describe FreqCounter do
  it 'counts the number of unique characters in an array of one string' do
    test_string = "jimmy_mcmahon@salesloft.com"
    results = FreqCounter.count_uniques([test_string])
    expect(results.values_at('m', 'j', 'o')).to eq([5, 1, 3])
  end

  it 'counts the number of unique characters in an array of many strings' do
    test_string = "jimmy_mcmahon@salesloft.com"
    results = FreqCounter.count_uniques([test_string, test_string])
    expect(results.values_at('m', 'j', 'o')).to eq([10, 2, 6])
  end
end