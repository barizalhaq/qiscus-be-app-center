module Qismo
    class GeneralService < ApplicationService
        
        def check_plan
            
            
            QismoPlan.new :name, :subscription_date, :subscription_status, :subscription_type
        end

        def list_plan

        end

        def get_channel

        end

    end
end