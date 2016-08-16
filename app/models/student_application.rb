class StudentApplication < ApplicationRecord
  belongs_to :student
  belongs_to :camp
  belongs_to :program
end
