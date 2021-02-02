class Subscription < ApplicationRecord
  belongs_to :app
  belongs_to :add_on
end
