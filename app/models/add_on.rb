class AddOn < ApplicationRecord
    has_many_attached :images

    def getImages
        return unless self.images.attachments
        images = self.images.map do |image|
            { name: image.blob.filename, image_url: image.service_url }
        end

        images
    end
end
