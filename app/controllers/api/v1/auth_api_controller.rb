class Api::V1::AuthApiController < ApiController
    skip_before_action :authenticate_request

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
end