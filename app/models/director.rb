class Director < ApplicationRecord
  # include Accountable
  belongs_to :account
  belongs_to :camp
end
