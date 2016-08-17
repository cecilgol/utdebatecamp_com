# Namespace for site_admin actions
class AdminController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    logger.debug 'called require_admin'

    unless current_user.account.admin?
      flash[:error] = 'You are not authorized to do that.'
      redirect_to root_path
    end
  end

end
