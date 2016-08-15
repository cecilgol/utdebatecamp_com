class AddIsAdmittedToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :is_admitted, :boolean
  end
end
