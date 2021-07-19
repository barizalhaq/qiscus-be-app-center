class CreateAddOns < ActiveRecord::Migration[5.2]
  def change
    create_table :add_ons do |t|
      t.string :name
      t.string :description
      t.string :author
      t.string :contact_email

      t.timestamps
    end
  end
end
