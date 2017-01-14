class Student < ApplicationRecord

  belongs_to :camp
  has_and_belongs_to_many :parents
  has_and_belongs_to_many :coaches

end
