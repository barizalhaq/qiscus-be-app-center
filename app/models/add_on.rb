require 'net/http'
require 'json'

class AddOn < ApplicationRecord
    has_many_attached :images
    has_one_attached :icon
    has_many :request_demos
    belongs_to :category

    validates :name, uniqueness: true

    validates :name, :author, :contact_email, :caption, :description,
        :identifier, :icon, presence: true

    validates :images, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..2.megabytes }
    validates :icon, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..2.megabytes }

    validates :name, :author, :caption, length: { minimum: 3, maximum: 255 }
    validates :name, :author, :caption, format: { with: /\A([a-zA-Z0-9]+\s)*[a-zA-Z0-9]+\z/ }

    validates :description, length: { minimum: 3 }

    validates :contact_email, email: true

    def getImages
        return unless self.images.attachments
        images = self.images.map do |image|
            { name: image.blob.filename, image_url: image.url }
        end

        images
    end

    def request_webhook(app)
        url = URI.parse(self.webhook_url)
        payload = {
            :app_code => app.app_code,
            :app_secret => app.secret,
            :app_name => app.name,
            :admin_email => "#{app.app_code}_admin@qiscus.com",
            :admin_token => app.token
        }
        res = Faraday.post(url) do |req|
            req.headers['Content-Type'] = 'application/json'
            req.headers['Authorization'] = webhook_token(app)
            req.body = payload.to_json
        end
    end

    private
    def webhook_token(app)
        payload = { app_code: app.app_code }
        token = JWT.encode payload, self.identifier, 'HS256'
        return token
    end
end
