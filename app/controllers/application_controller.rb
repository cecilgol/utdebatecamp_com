class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :application_vars

  def is_admin?
    current_user.account.accountable.is_a? SiteAdministrator
  end


  # Navbar links
  def application_vars
    if !@camps
      @camps = Camp.all
    end
  end
end
