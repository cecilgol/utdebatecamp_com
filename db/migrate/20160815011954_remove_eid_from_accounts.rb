class RemoveEidFromAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :eid
  end
end
