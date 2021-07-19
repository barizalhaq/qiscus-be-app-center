module Qismo
    class Cci::CciService < ApplicationService
        def initialize(demo)
            @contact_us = demo
            @token = @contact_us.app.token
            @addon = @contact_us.add_on
        end

        def register_app
            api = CciApi.new(@token, @addon.webhook_url, @addon.identifier)
            api.register()
        end

    end
end