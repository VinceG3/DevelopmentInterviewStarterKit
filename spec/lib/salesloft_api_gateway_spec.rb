require 'spec_helper'
require 'json'
require_relative '../../lib/salesloft_api_gateway'

describe SalesloftApiGateway do
  it 'connects with the Salesloft API' do
    expect{SalesloftApiGateway.request(:all_people)}.to_not raise_error
  end

  it 'returns a json response when given an endpoint' do
    expect(JSON.parse(SalesloftApiGateway.request(:all_people))).to_not be_empty
  end

  it 'does not error when given a valid endpoint' do
    response = JSON.parse(SalesloftApiGateway.request(:all_people))
    expect(response).to_not have_key('error'), response['error']
  end

  it 'gets the second page if passed a parameter' do
    response = JSON.parse(SalesloftApiGateway.request(:all_people, page: 2))
    expect(response.dig('metadata', 'paging', 'current_page')).to eq(2)
  end

  it 'doesn\'t make an API call if there\'s a cache'
end
