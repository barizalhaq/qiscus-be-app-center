module Qismo
    class GeneralService < ApplicationService
        
        def initialize(app_code, token)
            @app_code = app_code
            @token = token
        end

        def is_eligible_for_marketplace?()
            features = request.features

            marketplace_f = features.select { |feature| feature['caption'] == 'Marketplace' }

            marketplace_f[0]['status'] === 1
        end

        def list_plan

        end

        def qiscus_channel
            qiscus = request.qiscus_channel
        end

        def channel_name
            qiscus = request.channel_name
        end

        private
        def request
            req = QismoApi.new(@app_code, @token)
        end
    end
end