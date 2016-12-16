class Employee < ApplicationRecord
  include Accountable
  belongs_to :camp
  belongs_to :program
  #serialize :references, String
  has_many :employee_applications
  accepts_nested_attributes_for :employee_applications, allow_destroy: true

  def hire
    self.toggle!(:is_hired)
  end

end
