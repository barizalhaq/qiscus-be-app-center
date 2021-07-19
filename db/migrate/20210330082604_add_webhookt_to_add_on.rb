class AddWebhooktToAddOn < ActiveRecord::Migration[5.2]
  def change
    add_column :add_ons, :webhook_url, :string
    add_column :add_ons, :identifier, :string
  end
end
