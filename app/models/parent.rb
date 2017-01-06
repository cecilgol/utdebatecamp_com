class Parent < ApplicationRecord
  # include Accountable
  has_and_belongs_to_many :students

end
