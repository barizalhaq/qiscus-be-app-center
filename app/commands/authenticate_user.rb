# app/commands/authenticate_user.rb

class AuthenticateUser
  prepend SimpleCommand

  def initialize(app_code, token)
    @app_code = app_code
    @token = token
  end

  def call
    {
      token: JsonWebToken::encode(app_secret: app.secret),
      app: app
    } if app
  end

  private

  attr_accessor :app_code, :token

  def app
    # app = App.find_by_app_code(app_code)
    # if app 
    #   return app if app && app.secret
    # else
    qismo_service = Qismo::GeneralService.new(@app_code, @token)
    qismo = qismo_service.qiscus_channel
    app = App.new(app_code: qismo.app_code, token: @token, name: qismo_service.channel_name, secret: qismo.secret)
      
    existing = App.find_by_app_code(app_code)
    if existing 
      # update token
      existing.token = @token
      existing.save
      return existing if app.secret
    else
      return app if app.secret && app.save
    end

    # && user.authenticate(password)
    errors.add :message, 'invalid credentials'
    nil
  end
end