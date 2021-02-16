class ApiController < ActionController::API
    include Response
    include ExceptionHandler

    before_action :authenticate_request
    attr_reader :current_app

    private

    def authenticate_request
        @current_app = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_app
    end
end