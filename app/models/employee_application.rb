class EmployeeApplication < ApplicationRecord
  belongs_to :employee
  belongs_to :camp



  validates_presence_of :camp, on: :create, message: "can't be missing"
  validates_presence_of :employee, on: :create, message: "can't be missing"
end
