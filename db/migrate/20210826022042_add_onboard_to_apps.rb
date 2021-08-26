class AddOnboardToApps < ActiveRecord::Migration[6.1]
  def change
    add_column :apps, :onboard, :boolean, default: true
  end
end
