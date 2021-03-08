class RequestDemo < ApplicationRecord
  belongs_to :app
  belongs_to :add_on

  validates :name, :presence => true
  validates :add_on, uniqueness: true
  # { scope: :app_code,
  #   message: "your request already in process" }

  enum status: { request: 0, process: 1, approved: 2, cancel: 3 }

end
