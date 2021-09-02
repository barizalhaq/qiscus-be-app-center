class AddDescriptionVideoColumnAddOnsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :add_ons, :description_video_url, :string, null: true
  end
end
