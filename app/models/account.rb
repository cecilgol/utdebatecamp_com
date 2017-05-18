class Account < ApplicationRecord
  belongs_to :user

  has_many :news_posts

  has_one :employee
  has_one :student
  has_one :director
  has_one :parent
  has_one :coach

  
  validates_presence_of :first_name, on: :create, message: "can't be blank"
  validates_presence_of :last_name, on: :create, message: "can't be blank"
  validates_presence_of :address1, on: :create, message: "can't be blank"
  validates_presence_of :city, on: :create, message: "can't be blank"
  validates_presence_of :state, on: :create, message: "can't be blank"
  
  validates_each :birthday do |record,attr,value|
    unless value == nil
      record.errors.add(attr,'must be of age to participate at UTNIF') if value >= Time.now - 9.years
    end
  end


  def promote_to_site_administrator
    SiteAdministrator.new(
      account_id: self.id,
      promoted_at: Time.now
      ).save!
  end

  def demote_from_site_administrator
    SiteAdministrator.destroy(SiteAdministrator.where(account_id: self.id).ids)
  end

  def admin?
    SiteAdministrator.exists?(account_id: self.id)
  end

  def director?
    Director.exists?(account_id: self.id)
  end

  def employee?
    Employee.exists?(account_id: self.id)
  end

  def student?
    Student.exists?(account_id: self.id)
  end

  def parent?
    Parent.exists?(account_id: self.id)
  end

  def coach?
    Coach.exists?(account_id: self.id)
  end

end
