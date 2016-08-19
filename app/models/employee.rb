class Employee < ApplicationRecord
  include Accountable
  belongs_to :camp
  belongs_to :program
  serialize :references, Array
  has_many :employee_applications
  accepts_nested_attributes_for :employee_applications, allow_destroy: true

  def hire
    self.is_hired = true
    save!
  end

end
