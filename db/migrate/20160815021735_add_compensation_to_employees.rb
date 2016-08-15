class AddCompensationToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :compensation, :float
  end
end
