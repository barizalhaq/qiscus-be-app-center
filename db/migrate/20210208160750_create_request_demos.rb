class CreateRequestDemos < ActiveRecord::Migration[5.2]
  def change
    create_table :request_demos do |t|
      t.references :app, foreign_key: true
      t.references :add_on, foreign_key: true
      t.string :contact_email
      t.string :contact_phone

      t.timestamps
    end
  end
end
