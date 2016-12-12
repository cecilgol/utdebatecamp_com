#manage accounts if admin

class Admin::AccountsController < AdminController
  before_filter :authenticate_user!
  before_filter :set_account, only:[:edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to admin_accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

end
