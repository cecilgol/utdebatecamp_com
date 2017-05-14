class Event < ApplicationRecord
  belongs_to :camp
  belongs_to :program

  def start_time
    self.schedule['start_time']
  end

  # jsonb_accessor :schedule, 
  #   is_recurring: :string,
  #   begins_on: :datetime, 
  #   ends_on: :datetime,
  #   frenquency: :string
end
