class Api::V1::AuthApiController < ApiController
    skip_before_action :authenticate_request
    before_action :is_eligible

    def authenticate
        command = AuthenticateUser.call(params[:app_code], params[:token])
        if command.success?
            render json: { 
                data: {
                    auth_token: command.result 
                },
                status: 200
            }
        else
            render json: { error: command.errors, status: 401 }, status: :unauthorized
        end
    end

    private

    def is_eligible
        service = Qismo::GeneralService.new(params[:app_code], params[:token])
        plan = service.check_plan

        render json: { message: :unauthorized, status: 401 },
            status: :unauthorized if !plan.name.match(/Marketplace/) && plan.subscription_status != :active
    end

end