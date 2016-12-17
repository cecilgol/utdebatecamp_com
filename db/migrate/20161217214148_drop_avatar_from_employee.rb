class DropAvatarFromEmployee < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :avatar_url
  end
end
