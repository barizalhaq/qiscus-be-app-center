require "base64"

class App < ApplicationRecord
    validates :app_code, uniqueness: true

    validates :app_code, :token, :secret, :name, presence: true

    has_many :subscriptions
    # validate :uniqueness_of_app_code

    # private
    # def uniqueness_of_app_code
    #     existing_record = App.find_by_app_code(app_code)
    #     unless existing_record.nil?
    #         errors.add(:app_code, "Record #{existing_record.id} already has the app code #{app_code}")
    #     end
    # end

    def my_add_ons
        instaled = Array.new
        self.subscriptions.each do |a|
            add_on = a.add_on
            payload = { app_code: self.app_code }
            encode = JWT.encode payload, add_on.identifier, 'HS256'
            add_on.setting_url = "#{add_on.setting_url}/#{encode}" unless add_on.setting_url.to_s.strip.empty?
            instaled.push(add_on)
        end

        return instaled
    end
end
