class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :app, foreign_key: true
      t.references :add_on, foreign_key: true

      t.timestamps
    end
  end
end
