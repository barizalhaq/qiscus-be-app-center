require 'net/http'
require 'json'

class QismoApi 
    def initialize(app_code = 'qisme', app_secret = 'qisme-123', token = 'A5wmVwtjhD3CIiIlQVCA')
        @base_url = ENV['QISMO_URL'] || 'https://multichannel.qiscus.com'
        @qiscus_sdk_app_code = app_code
        @qiscus_sdk_secret = app_secret
        @qismo_token = token
    end

    def check_plan
        res = request.get('admin/my_plan')
        byebug
        if res.status == 200
            body = JSON.parse(res.body)
            data = ['data']
            plan = QismoPlan.new data['name'], data['subscription_date'], data['subscription_status'], data['subscription_type']
            return plan
        else
            return nil
        end
    end

    private
    def request 
        conn = Faraday.new(
            url: @base_url + '/api/v1',
            headers: {
                'Content-Type' => 'application/json',
                'Authorization' => @qismo_token
            }
        )
    end
end