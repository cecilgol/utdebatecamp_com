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


end
