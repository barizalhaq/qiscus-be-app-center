# app/controllers/concerns/response.rb
module Response
  def json_response(object, status = 200)
    render json: {
      data: object,
      status: status 
    }
  end
end