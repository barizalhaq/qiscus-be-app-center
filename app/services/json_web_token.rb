class JsonWebToken
  def self.encode(payload, secret = ENV['API_SECRET_KEY'])
    # payload[:exp] = 1.hours.from_now.to_i
    JWT.encode(payload, secret)
  end

  def self.decode(token)
    @key = ENV['API_SECRET_KEY']
    body = JWT.decode(token, @key)[0]
    HashWithIndifferentAccess.new body
  rescue
    nil
  end

  private
  def secret_key
    ENV['API_SECRET_KEY']
    # Rails.application.secrets&.secret_key_base || Rails.application.credentials&.secret_key_base
  end
end