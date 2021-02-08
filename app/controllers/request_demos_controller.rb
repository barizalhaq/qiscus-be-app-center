class RequestDemosController < InheritedResources::Base

  private

    def request_demo_params
      params.require(:request_demo).permit(:app_id, :add_on_id, :contact_email, :contact_phone)
    end

end
