require 'net/http'
require 'json'

# Add on api
# Send webhook to add on service with protection
# 
class CciApi

    def initialize(token, url, id)  
        @webhook_url = url
        @identifier = id
        @qismo_token = token
    end

    def register(requester, note, subscription_code)
        payload = {
            "code": subscription_code,
            "requester": requester,
            "note": note
        }
        
        res = Faraday.post(@webhook_url) do |req|
            req.headers['Content-Type'] = 'application/json'
            req.headers['Identifier'] = @identifier
            req.headers['Authorization'] = @qismo_token
            req.body = payload
        end
        
    end

end