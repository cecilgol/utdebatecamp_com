class Employee < ApplicationRecord
  # include Accountable
  belongs_to :account
  belongs_to :camp
  has_many :programs
  has_many :labs
  #serialize :references, String
  has_many :employee_applications
  # accepts_nested_attributes_for :employee_applications, allow_destroy: true

  has_attached_file :avatar

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def hire
    self.toggle!(:is_hired)
  end

end
