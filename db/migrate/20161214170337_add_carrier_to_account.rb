class AddCarrierToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :carrier, :string
  end
end
