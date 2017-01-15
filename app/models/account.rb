class Account < ApplicationRecord
  belongs_to :user

  has_many :news_posts
  
  has_one :employee
  has_one :student
  has_one :director
  has_one :parent
  has_one :coach

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
