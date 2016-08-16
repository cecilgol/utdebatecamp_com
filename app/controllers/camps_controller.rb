class CampsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_camp, only: [:show, :edit, :update, :destroy, :sign_up, :apply_to_work]

  respond_to :html, :js

  # GET /camps
  # GET /camps.json
  def index
    @camps = Camp.all
  end

  # GET /camps/1
  # GET /camps/1.json
  def show
  end

  # GET /camps/new
  def new
    @camp = Camp.new
  end

  # GET /camps/1/edit
  def edit
  end

  # POST /camps
  # POST /camps.json
  def create
    @camp = Camp.new(camp_params)

    respond_to do |format|
      if @camp.save
        format.html { redirect_to @camp, notice: 'Camp was successfully created.' }
        format.json { render :show, status: :created, location: @camp }
      else
        format.html { render :new }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camps/1
  # PATCH/PUT /camps/1.json
  def update
    respond_to do |format|
      if @camp.update(camp_params)
        format.html { redirect_to @camp, notice: 'Camp was successfully updated.' }
        format.json { render :show, status: :ok, location: @camp }
      else
        format.html { render :edit }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camps/1
  # DELETE /camps/1.json
  def destroy
    @camp.destroy
    respond_to do |format|
      format.html { redirect_to camps_url, notice: 'Camp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /sign_up/1
  def sign_up
    unless current_user.account
      redirect_to new_account_path
      flash[:alert] = 'You must create an account first'
    end
    a = current_user.account.accountable
    case a
    when a.is_a?(Student)
      then @student = current_user.account.accountable
    else
      @student = Student.new.build_account
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_camp
      @camp = Camp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_params
      params.require(:camp).permit(:name,:nickname,:info,:start_date,:end_date)
    end
end
