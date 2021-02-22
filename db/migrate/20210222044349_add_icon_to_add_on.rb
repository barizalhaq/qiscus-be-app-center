class AddIconToAddOn < ActiveRecord::Migration[5.2]
  def change
    add_column :add_ons, :icon_url, :string
  end
end
