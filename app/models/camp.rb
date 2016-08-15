class Camp < ApplicationRecord
  has_many :students
  has_many :employees
  has_many :labs
  
  has_one :director

  validates :name, presence: true
  validates :info, presence: true, length: {minimum: 280, maximum: 1000}

end
