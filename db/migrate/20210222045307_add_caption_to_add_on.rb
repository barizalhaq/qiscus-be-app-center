class AddCaptionToAddOn < ActiveRecord::Migration[5.2]
  def change
    add_column :add_ons, :caption, :string
  end
end
