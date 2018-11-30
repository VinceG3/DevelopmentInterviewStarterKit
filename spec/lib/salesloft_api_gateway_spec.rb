require 'spec_helper'
require 'json'
require_relative '../../lib/salesloft_api_gateway'

describe SalesloftAPIGateway do
  it 'connects with the Salesloft API' do
    expect{SalesloftAPIGateway.request('/v2/people.json')}.to_not raise_error
  end

  it 'returns a json response when given an endpoint' do
    expect(JSON.parse(SalesloftAPIGateway.request('/v2/people.json'))).to_not be_empty
  end

  it 'does not error when given a valid endpoint' do
    response = JSON.parse(SalesloftAPIGateway.request('/v2/people.json'))
    expect(response).to_not have_key('error'), response['error']
  end
end