class Employee < ApplicationRecord
  include Accountable
  belongs_to :camp
  belongs_to :program
  has_many :employee_applications
end
