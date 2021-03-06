class RequestDemo < ApplicationRecord
  belongs_to :app
  belongs_to :add_on

  validates :name, :reason, :contact_email, :contact_phone, :presence => true
  validates :add_on, uniqueness: {:scope => [:add_on_id, :app_id]}

  validates :contact_phone, telephone_number: { country: :id, types: [:fixed_line, :mobile] }

  validates :contact_email, email: true

  before_save :activate_add_on

  enum status: { request: 0, process: 1, approved: 2, cancel: 3 }

  private
  # TODO: refactor new subscription handle in controller
  def activate_add_on
    if status == "approved"
      subscribe = Subscription.new(app: app, add_on: add_on)
      subscribe.save
    end
  end
end