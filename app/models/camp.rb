class Camp < ApplicationRecord
  has_many :students

  validates :name, presence: true
  validates :info, presence: true, length: {minimum: 280, maximum: 1000}

end
