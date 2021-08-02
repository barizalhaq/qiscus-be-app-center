class ApiController < ActionController::API
    include Response
    include ExceptionHandler

    before_action :authenticate_request
    attr_reader :current_app

    around_action :log_request

    private

    def authenticate_request
        @current_app = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_app
    end

    def log_request
        http_request_header_keys = request.headers.env.keys.select{|header_name| header_name.match("^HTTP.*|^X-User.*")}
        http_request_headers = request.headers.env.select{|header_name, header_value| http_request_header_keys.index(header_name)}
        logger.info '*' * 40
        pp request.method
        pp request.url
        pp request.remote_ip

        http_request_header_keys.each do |key|
            logger.info ["%20s" % key.to_s, ':', request.headers[key].inspect].join(" ")
        end
        logger.info '-' * 40
        params.keys.each do |key|
            logger.info ["%20s" % key.to_s, ':', params[key].inspect].join(" ")
        end
        logger.info '*' * 40
        begin
            yield
        ensure
            logger.info response.body
        end
    end
end