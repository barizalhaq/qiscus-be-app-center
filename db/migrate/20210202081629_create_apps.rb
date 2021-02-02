class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.string :app_code
      t.string :token
      t.string :secret
      t.string :name

      t.timestamps
    end
  end
end
