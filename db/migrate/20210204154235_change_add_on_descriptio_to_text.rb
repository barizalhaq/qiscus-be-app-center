class ChangeAddOnDescriptioToText < ActiveRecord::Migration[5.2]
  def change
    change_column :add_ons, :description, :text
  end
end
