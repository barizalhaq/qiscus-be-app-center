class Subscription < ApplicationRecord
  belongs_to :app
  belongs_to :add_on

  validates :add_on, uniqueness: {:scope => [:add_on_id, :app_id]}

  after_save :add_on_request_webhook

  def add_on_request_webhook
    self.add_on.request_webhook(self.app) unless self.add_on.webhook_url.to_s.strip.empty?
  end
end
