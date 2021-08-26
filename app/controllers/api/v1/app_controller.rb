class Api::V1::AppController < ApiController
    def onboard_finished
        @current_app.update onboard: params[:onboard]
        render json: {
            data: {
                app: @current_app
            }
        }, status: :ok
    end
end