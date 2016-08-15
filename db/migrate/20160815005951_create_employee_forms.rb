class CreateEmployeeForms < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_forms do |t|
      t.references :employee, foreign_key: true
      t.string :file_location

      t.timestamps
    end
  end
end
