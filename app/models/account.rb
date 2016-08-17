class Account < ApplicationRecord
  belongs_to :user
  belongs_to :accountable, polymorphic: true
  def promote_to_site_administrator
    SiteAdministrator.new(
      account_id: self.id,
      promoted_at: Time.now
      ).save!
    self.accountable = SiteAdministrator.last
    save!
  end

  def admin?
    self.accountable.class == SiteAdministrator
  end

  def director?
    self.accountable.class == Director
  end

  def employee?
    self.accountable.class == Director
  end

  def student?
    self.accountable.class == Student
  end

  def parent?
    self.accountable.class == Parent
  end

end
