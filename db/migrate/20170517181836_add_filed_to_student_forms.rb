class AddFiledToStudentForms < ActiveRecord::Migration[5.1]
  def change
    add_column :student_forms, :filed, :boolean
    add_column :student_forms, :treatment_consent, :boolean
    add_column :student_forms, :off_campus_permission, :boolean
    add_column :student_forms, :release_and_indemnification, :boolean
    add_column :student_forms, :witness, :boolean
    add_column :student_forms, :year, :date
    add_column :student_forms, :allergies, :string
    add_column :student_forms, :media_release, :boolean
    # add_column :student_forms, :perscriptions, :string
    # add_column :student_forms, :may_posess
  end
end
