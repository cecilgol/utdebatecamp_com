class Camp < ApplicationRecord
  has_many :students
  has_many :employees, inverse_of: :camp
  has_many :labs
  has_many :programs
  
  has_one :director

  has_attached_file :glossy

  store_accessor :oblique
  validates :name, presence: true
  validates :info, presence: true, length: {minimum: 280, maximum: 1000}
  validates :nickname, presence: true, length: {maximum: 3}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_attachment_content_type :glossy, content_type: /\Aimage\/.*\z/

  def print_class_name
    self.name.gsub(/[Dd]ebate/,'').parameterize.downcase
  end


end
