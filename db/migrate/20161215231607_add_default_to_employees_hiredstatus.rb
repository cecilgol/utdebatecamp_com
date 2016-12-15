class AddDefaultToEmployeesHiredstatus < ActiveRecord::Migration[5.0]
  def change
    change_column :employees, :is_hired, :boolean, default: false
  end
end
