class AddInstallToAddOn < ActiveRecord::Migration[5.2]
  def change
    add_column :add_ons, :how_to_install, :text
  end
end
