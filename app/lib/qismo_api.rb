require 'net/http'
require 'json'

class QismoApi 
    def initialize(app_code, token)
        @base_url = ENV['QISMO_URL'] || 'https://multichannel.qiscus.com'
        @qiscus_sdk_app_code = app_code
        # @qiscus_sdk_secret = app_secret
        @qismo_token = token
    end

    def features
        res = request.get('api/v2/features')
        if res.status == 200
            body = JSON.parse(res.body)
            data = body['data']
            return data['features']
        else
            return nil
        end
    end

    def qiscus_channel
        res = request.get('/api/v2/channels')
        if res.status == 200
            body = JSON.parse(res.body)
            data = body['data']['qiscus_channels'].first
            channel = QiscusChannel.new data['id'], data['app_code'], data['secret_key'], data['name']
            return channel
        else
            return nil
        end
    end

    def channel_name
        res = request.get("/api/v1/admin/get_profile")
        if res.status == 200
            body = JSON.parse(res.body)
            data = body["data"]
            return data["name"]
        end
        return nil
    end

    private
    def request 
        conn = Faraday.new(
            url: @base_url,
            headers: {
                'Content-Type' => 'application/json',
                'Authorization' => @qismo_token
            }
        )
    end
end