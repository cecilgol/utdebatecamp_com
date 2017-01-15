class Employee < ApplicationRecord

  belongs_to :account
  belongs_to :camp, inverse_of: :employees
  has_many :programs
  has_many :labs

  has_many :employee_applications


  has_attached_file :avatar

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def hire
    self.toggle!(:is_hired)
    EmployeeMailer.hired_email(self).deliver
  end

end
