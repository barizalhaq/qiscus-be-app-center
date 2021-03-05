require 'net/http'
require 'json'

class SlackApi
    def initialize

    end

    def notif(request_demo)
        res = request.get('admin/my_plan')
        ress = request.post('services/THLPKPYKD/B01QP93S84Q/QqDnX5220fuCrgB7UWYS36oK') do |r|
            # r.params[] = 
            r.body = message(request_demo)
        end

        if res.status == 200
            body = JSON.parse(res.body)
            data = ['data']
            return true
        else
            return false
        end
    end

    private
    def request 
        conn = Faraday.new(
            url: 'https://hooks.slack.com/',
            headers: {
                'Content-Type' => 'application/json'
            }
        )
    end
    
    def message(request_demo)
        message = {
            "blocks": [
                {
                    "type": "header",
                    "text": {
                        "type": "plain_text",
                        "text": "Request Add On",
                        "emoji": true
                    }
                },
                {
                    "type": "section",
                    "fields": [
                        {
                            "type": "mrkdwn",
                            "text": "*Type:*\n#{request_demo.add_on.name}"
                        },
                        {
                            "type": "mrkdwn",
                            "text": "*Request by:*\n<example.com|#{request_demo.name}>"
                        }
                    ]
                },
                {
                    "type": "section",
                    "fields": [
                        {
                            "type": "mrkdwn",
                            "text": "*email / phone :*\n#{request_demo.contact_email} #{request_demo.contact_phone}"
                        }
                    ]
                },
                {
                    "type": "section",
                    "text": {
                        "type": "plain_text",
                        "text": "This is a plain text section block.",
                        "emoji": true
                    }
                }
            ]
        }

        return message.to_json
    end
end