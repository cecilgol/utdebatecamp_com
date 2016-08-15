class Director < ApplicationRecord
  include Accountable
  belongs_to :camp
end
