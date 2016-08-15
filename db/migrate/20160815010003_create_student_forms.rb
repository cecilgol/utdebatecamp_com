class CreateStudentForms < ActiveRecord::Migration[5.0]
  def change
    create_table :student_forms do |t|
      t.references :student, foreign_key: true
      t.string :file_location

      t.timestamps
    end
  end
end
