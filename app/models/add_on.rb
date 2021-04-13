class AddOn < ApplicationRecord
    has_many_attached :images
    has_many :request_demos

    validate :image_file

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
end
