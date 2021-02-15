# app/commands/authenticate_user.rb

class AuthenticateUser
  prepend SimpleCommand

  def initialize(app_code, token)
    @app_code = app_code
    @token = token
  end

  def call
    JsonWebToken::encode(app_id: app.id) if app
  end

  private

  attr_accessor :app_code, :token

  def app
    app = App.find_by_app_code(app_code)
    return app if app && app.token
    # && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end