class Program < ApplicationRecord
  belongs_to :camp
  has_many :students
  has_many :employees
  
end
