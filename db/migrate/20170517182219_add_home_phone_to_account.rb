class AddHomePhoneToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :home_phone, :string
  end
end
