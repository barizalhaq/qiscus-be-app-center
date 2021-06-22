class Category < ApplicationRecord
    validates :title, presence: true, uniqueness: true, format: { with: /\A([a-zA-Z0-9]+\s)*[a-zA-Z0-9]+\z/ }
end
