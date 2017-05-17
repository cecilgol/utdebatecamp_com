class Event < ApplicationRecord
  belongs_to :camp
  belongs_to :program

  validates_presence_of :start_date, on: :create, message: "can't be blank"
  
  def ic_schedule
    IceCube::Schedule.from_hash(self.schedule)
  end

  def start_time
    self.start_date
  end


  # jsonb_accessor :schedule, 
  #   is_recurring: :string,
  #   begins_on: :datetime, 
  #   ends_on: :datetime,
  #   frenquency: :string
end
