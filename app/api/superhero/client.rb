module Superhero
    class Client

    BASE_URL = 'https://superheroapi.com/api.php'

    def initialize (api_token = Rails.application.credentials.dig(:superhero))
        @api_token = api_token
    end

    def generateRandomNumber
       @number =  rand(253)+1
    end

    def getPlayerByPowerstats
        generateRandomNumber

        request(
                http_method: :get,
                endpoint: "#{@api_token}/#{@number}"
                  )
    end

        private

        def request(http_method: , endpoint: , params: {})
        @response = connection.public_send(http_method, endpoint, params)
        parsed_data = JSON.parse(@response.body)

        return parsed_data if successful?
        raise  RuntimeError ,"Code: #{@response.status} , #{@response.body}"
        end

        def connection
            @connection ||= Faraday.new(BASE_URL) do | info |
            info.request :url_encoded
            info.adapter Faraday.default_adapter
            info.headers['Authorization'] = "token #{@api_token}" if @api_token.present?
            end
        end

            def successful?
                @response.status == 200
            end
        
    end
 end

