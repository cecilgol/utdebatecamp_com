class Program < ApplicationRecord
  belongs_to :camp
  
# Program.stduents
  has_many :program_student_assignments
  has_many :students, through: :program_student_assignments

# Program.employees
  has_many :employee_program_assignments
  has_many :employees, through: :employee_program_assignments
  
end
