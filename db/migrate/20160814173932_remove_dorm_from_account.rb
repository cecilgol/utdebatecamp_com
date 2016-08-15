class RemoveDormFromAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :dorm
  end
end
