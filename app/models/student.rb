class Student < ApplicationRecord
  belongs_to :camp
  belongs_to :account

# Student.programs
  has_many :program_student_assignments, dependent: :destroy
  has_many :students, through: :program_student_assignments, dependent: :destroy

  has_many :emergency_contacts, dependent: :destroy
  has_many :student_forms, dependent: :destroy

  has_and_belongs_to_many :parents
  has_and_belongs_to_many :coaches


end
