require 'uri'
require 'net/http'

class SalesloftApiGateway
  class << self
    def request(endpoint, params = {})
      url = URI("http://api.salesloft.com/#{endpoint_path(endpoint)}")
      url.query = URI.encode_www_form(params)
    
      http = Net::HTTP.new(url.host, url.port)
      puts "loading #{endpoint} page #{params[:page]}"
      request = Net::HTTP::Get.new(url)
      request["authorization"] = "Bearer #{ENV['SALESLOFT_API_KEY']}"
      request["cache-control"] = 'no-cache'

      response = http.request(request)
      JSON.load response.read_body
    end

    def endpoint_path(call_sym)
      {
        all_people: 'v2/people.json',
      }[call_sym]
    end

    def retrieve_all(endpoint)
      # blocks until all pages are retrieved from the api. Could in the future retrun just
      # the one page needed while making a job to get the rest
      records = []
      first = request(endpoint)
      records.concat(first['data'])
      page = 2
      stop = false
      until stop
        new_results = request(endpoint, page: page)
        records.concat new_results['data']
        stop = true if new_results['data'].count < 25
        page += 1
      end
      records
    end
  end
end
