class AddNicknameIndexToCamp < ActiveRecord::Migration[5.0]
  def change
    add_index :camps, :nickname, :unique => true
  end
end
