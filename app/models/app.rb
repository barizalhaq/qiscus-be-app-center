class App < ApplicationRecord
    validate :uniqueness_of_app_code

    private
    def uniqueness_of_app_code
        existing_record = App.find_by_app_code(app_code)
        unless existing_record.nil?
            errors.add(:app_code, "Record #{existing_record.id} already has the app code #{app_code}")
        end
    end
end
