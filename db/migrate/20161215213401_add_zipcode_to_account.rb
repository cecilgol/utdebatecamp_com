class AddZipcodeToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :zipcode, :string
  end
end
