class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts/new
  def new
    @account = Account.new
  end

  def accountable_change
    @s = params[:s]
    @a = Account.new(user: current_user)
    @p = @s.constantize.new

    respond_to do |format|
      format.js { render :accountable_change, s: @s, a: @a, p: @p }
    end
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user = current_user
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.fetch(:account, {}).permit(:first_name, :middle_name, :last_name,
                                      :cell_phone, :other_phone, :address1,
                                      :address2, :city, :state, :country,
                                      :birthday, :eid,
                                      accountable_attributes: [:accountable_type, :bio, :experience, :references])
  end

end
