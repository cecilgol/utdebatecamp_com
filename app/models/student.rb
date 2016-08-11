class Student < ApplicationRecord
  belongs_to :camp
  belongs_to :account
  accepts_nested_attributes_for :account, allow_destroy: true, limit: 1

end
