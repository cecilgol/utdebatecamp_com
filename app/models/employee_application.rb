class EmployeeApplication < ApplicationRecord
  belongs_to :employee
  belongs_to :camp
  belongs_to :program
end
