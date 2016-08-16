class CreateStudentApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :student_applications do |t|
      t.references :student, foreign_key: true
      t.references :camp, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
