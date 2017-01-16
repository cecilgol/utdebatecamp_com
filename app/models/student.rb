class Student < ApplicationRecord
  belongs_to :camp

# Student.programs
  has_many :program_student_assignments
  has_many :students, through: :program_student_assignments

  has_and_belongs_to_many :parents
  has_and_belongs_to_many :coaches

end
