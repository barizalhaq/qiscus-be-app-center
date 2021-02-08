class ApplicationController < ActionController::Base
    
end

class ApiController < ActionController::API
    include Response
    include ExceptionHandler
end