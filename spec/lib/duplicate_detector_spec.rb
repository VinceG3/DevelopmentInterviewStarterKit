require 'spec_helper'
require 'json'
require_relative '../../lib/duplicate_detector'

describe DuplicateDetector do
  it 'calculates the levenshtein distance between two email addresses' do
    emails = ['benoliv@salesloft.com', 'benolive@salesloft.com']
    distance = DuplicateDetector.score_pair *emails
    expect(distance).to be(1.0)
  end

  it 'isn\'t case sensitive for the domain part' do
    emails = ['benolive@salesloft.com', 'benolive@Salesloft.com']
    distance = DuplicateDetector.score_pair *emails
    expect(distance).to be(0.0)
  end

  it 'doubles the score for domain errors' do
    emails = ['benolive@salesloft.com', 'benolive@Salesloftd.com']
    distance = DuplicateDetector.score_pair *emails
    expect(distance).to be(1.5)
  end

  it 'filters out emails that reach the threshold' do
    emails = ['vguidry@gmail.com', 'benol@salesloft.com', 'benolive@Salesloftd.com']
    scores = DuplicateDetector.score_list emails
    expected = []
    expect(scores).to eq(expected)
  end

  it 'returns a list of pairs of emails that don\'t reach the threshold' do
    emails = ['vguidry@gmail.com', 'benoliv@salesloft.com', 'benolive@Salesloftd.com', 'Benoliv@salesloft.com']
    scores = DuplicateDetector.score_list emails
    expected = [
      ['benoliv@salesloft.com','benolive@Salesloftd.com'],
      ['benoliv@salesloft.com', 'Benoliv@salesloft.com'],
      ['benolive@Salesloftd.com', 'Benoliv@salesloft.com'],
    ]
    expect(scores).to contain_exactly(*expected)
  end
end
