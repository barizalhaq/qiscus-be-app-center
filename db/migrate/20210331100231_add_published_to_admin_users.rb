class AddPublishedToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :add_ons, :published, :boolean, :default => false
  end
end
