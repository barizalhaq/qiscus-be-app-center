class AddNameToRequestDemo < ActiveRecord::Migration[5.2]
  def change
    add_column :request_demos, :name, :string
  end
end
