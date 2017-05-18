# Things only administrators can do
class Admin::CampsController < AdminController
  before_action :set_camp, only: [:show, :edit, :update, :destroy, :sign_up, :students]

  respond_to :html, :js



  def index
    @camps = Camp.order(id: :asc)
  end



  def show
  end


  def new
    @camp = Camp.new
  end


  def edit
  end

  def students
    @students = @camp.students
  end
    



  def create
    @camp = Camp.new(camp_params)

    respond_to do |format|
      if @camp.save
        format.html { redirect_to admin_camp_path(@camp.id), notice: 'Camp was successfully created.' }
        format.json { render :show, status: :created, location: @camp }
      else
        format.html { render :new }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @camp.update(camp_params)
        format.html { redirect_to admin_camp_path(@camp.id), notice: 'Camp was successfully updated.' }
        format.json { render :show, status: :ok, location: @camp }
      else
        format.html { render :edit }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @camp.destroy
    respond_to do |format|
      format.html { redirect_to admin_camps_path, notice: 'Camp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


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


  def set_camp
    @camp = Camp.find(params[:id])
  end


  def camp_params
    params.require(:camp).permit(:name,:nickname,:info,:start_date,:end_date,:glossy,:info_blurb,:staff_blurb, oblique: [:main,:one,:two,:three])
  end
end