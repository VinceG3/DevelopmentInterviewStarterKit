require 'uri'
require 'net/http'

class SalesloftAPIGateway
  def self.request(endpoint, params = {})
    url = URI("http://api.salesloft.com/#{endpoint}")

    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["authorization"] = "Bearer #{ENV['API_KEY']}"
    request["cache-control"] = 'no-cache'

    response = http.request(request)
    response.read_body
  end
end