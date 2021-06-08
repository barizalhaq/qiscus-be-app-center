class Subscription < ApplicationRecord
  belongs_to :app
  belongs_to :add_on

  validates :add_on, uniqueness: {:scope => [:add_on_id, :app_id]}

  after_save :add_on_request_webhook

  def add_on_request_webhook
    puts self.add_on.request_webhook(self.app) if !self.add_on.setting_url.to_s.strip.empty?
  end
end
