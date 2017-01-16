class CreateEmployeeProgramAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_program_assignments do |t|
      t.references :employee, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
