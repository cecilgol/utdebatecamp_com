class AddIsHiredToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :is_hired, :boolean
  end
end
