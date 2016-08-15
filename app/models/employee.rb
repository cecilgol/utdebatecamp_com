class Employee < ApplicationRecord
  include Accountable
  belongs_to :camp
  belongs_to :program
end
