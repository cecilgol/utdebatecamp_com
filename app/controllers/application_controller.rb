class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_admin?
    current_user.account.accountable.is_a? SiteAdministrator
  end


end
