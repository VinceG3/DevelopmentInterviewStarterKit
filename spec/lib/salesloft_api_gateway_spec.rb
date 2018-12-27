require 'spec_helper'
require 'json'
require_relative '../../lib/salesloft_api_gateway'

describe SalesloftApiGateway do
  xit 'connects with the Salesloft API' do
    expect{SalesloftApiGateway.request(:all_people)}.to_not raise_error
  end

  xit 'returns a json response when given an endpoint' do
    expect(SalesloftApiGateway.request(:all_people)).to_not be_empty
  end

  xit 'does not error when given a valid endpoint' do
    response = SalesloftApiGateway.request(:all_people)
    expect(response).to_not have_key('error'), response['error']
  end

  xit 'gets the second page if passed a parameter' do
    response = SalesloftApiGateway.request(:all_people, page: 2)
    expect(response.dig('metadata', 'paging', 'current_page')).to eq(2)
  end

  it 'doesn\'t make an API call if there\'s a cache'
end
