require 'uri'
require 'net/http'

class SalesloftApiGateway
  def self.request(endpoint, params = {})
    url = URI("http://api.salesloft.com/#{endpoint_path(endpoint)}")
    url.query = URI.encode_www_form(params)
    # cached_response = read_cache(url.to_s)

    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["authorization"] = "Bearer #{ENV['SALESLOFT_API_KEY']}"
    request["cache-control"] = 'no-cache'

    response = http.request(request)
    response.read_body
  end

  def self.endpoint_path(call_sym)
    {
      all_people: 'v2/people.json',
    }[call_sym]
  end
end