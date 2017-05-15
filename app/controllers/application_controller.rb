class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :application_vars
  include ApplicationHelper  

# TODO: fix scss/custom/app-block.scss

  def is_admin?
    current_user.account.accountable.is_a? SiteAdministrator
  end

  def is_employee?
    current_user.account.accountable.is_a? Employee
  end



  def application_vars
      @camps = Camp.order(id: :asc)
  end

  def append_info_to_payload(payload)
    super
    payload[:user] = current_user.account.last_name if user_signed_in? and current_user.account != nil
  end
end
