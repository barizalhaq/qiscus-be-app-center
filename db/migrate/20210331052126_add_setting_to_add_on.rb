class AddSettingToAddOn < ActiveRecord::Migration[5.2]
  def change
    add_column :add_ons, :setting_url, :string
  end
end
