require "base64"

class App < ApplicationRecord
    validates :app_code, uniqueness: true

    validates :app_code, :token, :secret, :name, presence: true

    has_many :subscriptions
    has_many :request_demos
    # validate :uniqueness_of_app_code

    # private
    # def uniqueness_of_app_code
    #     existing_record = App.find_by_app_code(app_code)
    #     unless existing_record.nil?
    #         errors.add(:app_code, "Record #{existing_record.id} already has the app code #{app_code}")
    #     end
    # end

    def my_add_ons(status:, category:, sort:, name:, per_page:, page: 1)
        installed = Array.new

        if status.to_s.empty? || status == "approved"
            self.subscriptions.each do |a|
                installed.push(a.add_on.id)
            end
        end

        if status.to_s.empty? || (status != "cancel" && status != "approved")
            demos = self.request_demos
            demos = demos.where(status: status) unless status.to_s.empty?
            demos.each do |demo|
                installed.push(demo.add_on.id)
            end
        end

        addons = AddOn.where(id: installed)
            .where('name ILIKE ?', "%#{name}%")
            .order("name #{sort.present? ? sort : "asc"}")

        addons = addons.joins(:category).where('title ILIKE ?', category) unless category.to_s.strip.empty?

        addons = addons.page(page || 1).per(per_page) unless per_page.to_s.strip.empty?

        addons.each do |addon|
            payload = { app_code: self.app_code }
            encode = JWT.encode payload, addon.identifier, 'HS256'
            addon.setting_url = "#{addon.setting_url}/#{encode}" unless addon.setting_url.to_s.strip.empty?
        end

        return addons
    end
end
