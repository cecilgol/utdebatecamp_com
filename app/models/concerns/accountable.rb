module Accountable
  extend ActiveSupport::Concern

  included do
    has_one :account, as: :accountable, dependent: :destroy

  end










  def added_by
    Account.find(self.added_by_id)
  end


end
