class Employee < ApplicationRecord

  belongs_to :account
  belongs_to :camp, inverse_of: :employees


# Employee.programs
  has_many :employee_program_assignments
  has_many :programs, through: :employee_program_assignments

  has_many :labs
 
  has_attached_file :avatar, styles: {thumb:["200x200#",:png]}, default_url: "/system/employees/avatars/default-:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def hire
    self.toggle!(:is_hired)
    # EmployeeMailer.hired_email(self).deliver
  end

end
