class AddCategoryToAddOns < ActiveRecord::Migration[5.2]
  def change
    add_reference :add_ons, :category, foreign_key: true
  end
end
