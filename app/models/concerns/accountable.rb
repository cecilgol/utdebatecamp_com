module Accountable
  extend ActiveSupport::Concern

  included do
    has_one :account, as: :accountable, dependent: :destroy
    #before_create :set_added_by
  end


  # def set_added_by
  #   if defined? current_user && current_user.account.present?
  #     self.added_by_id = current_user.account.id
  #   else
  #     self.added_by_id = 1
  #   end
  # end

  def added_by
    Account.find(self.added_by_id)
  end

end
