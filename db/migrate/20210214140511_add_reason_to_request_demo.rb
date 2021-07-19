class AddReasonToRequestDemo < ActiveRecord::Migration[5.2]
  def change
    add_column :request_demos, :reason, :text
    add_column :request_demos, :status, :integer, defalut: 0
  end
end
