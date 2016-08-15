class LabStudent < ApplicationRecord
  belongs_to :lab
  belongs_to :student
end
