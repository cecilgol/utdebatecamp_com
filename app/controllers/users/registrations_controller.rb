class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
  respond_to :html,:js


































  protected












  def after_sign_up_path_for(resource)
    super(resource)
    create_account_path
  end





end