module Qismo
    class GeneralService < ApplicationService
        
        def initialize(app_code, token)
            @app_code = app_code
            @token = token
        end

        def check_plan()
            plan = request.check_plan
        end

        def list_plan

        end

        def qiscus_channel
            qiscus = request.qiscus_channel
        end

        private
        def request
            req = QismoApi.new(@app_code, @token)
        end
    end
end