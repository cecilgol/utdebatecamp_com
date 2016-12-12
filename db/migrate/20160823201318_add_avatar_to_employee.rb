class AddAvatarToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :avatar_url, :string, limit: 40
  end
end
