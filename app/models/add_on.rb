require 'net/http'
require 'json'

class AddOn < ApplicationRecord
    has_many_attached :images
    has_many :request_demos

    validate :image_file
    validates :name, :author, :contact_email, :caption, :description,
        :how_to_install, :icon_url, :webhook_url, :setting_url, :identifier, presence: true

    def getImages
        return unless self.images.attachments
        images = self.images.map do |image|
            { name: image.blob.filename, image_url: image.service_url }
        end

        images
    end

    def image_file
        images.each do |img|
            if !img.content_type.in?(%w(image/png image/jpg image/jpeg image/svg))
                errors[:images] << "Must be an image format (png/jpg/jpeg/svg)"
            end
        end
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
