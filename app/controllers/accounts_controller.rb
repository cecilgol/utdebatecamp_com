class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  ALLOWED_S = %w( Parent Student Employee Coach )

  def index
    @account = Account.find(current_user.account)
  end


  def new
    @account = Account.new

    if params.has_key?(:s) && ALLOWED_S.include?(params[:s])
      @s = params[:s]
      respond_to do |format|
        format.js { render :accountable_change, s: @s, a: @a, p: @p }


      end
    end

  end

  def edit

  end












  def create
    @account = Account.new(account_params)
    @account.user = current_user
    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end


  def account_params
    params.fetch(:account, {}).permit(:first_name, :middle_name, :last_name,
                                      :cell_phone, :other_phone, :address1,
                                      :address2, :city, :state, :country,
                                      :birthday, :eid,
                                      accountable_attributes: [:accountable_type, :bio, :experience, :references])
  end

end
