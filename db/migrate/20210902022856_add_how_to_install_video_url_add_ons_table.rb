class AddHowToInstallVideoUrlAddOnsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :add_ons, :how_to_install_video_url, :string, null: true
  end
end
