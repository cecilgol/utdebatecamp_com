# Things only administrators can do
class Admin::LabsController < AdminController
  before_action :set_lab, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js



  def index
    @labs = Lab.all
  end



  def show
  end


  def new
    @lab = Lab.new
  end


  def edit
  end



  def create
    @lab = Lab.new(lab_params)

    respond_to do |format|
      if @lab.save
        format.html { redirect_to @lab, notice: 'Lab was successfully created.' }
        format.json { render :show, status: :created, location: @lab }
      else
        format.html { render :new }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @lab.update(lab_params)
        format.html { redirect_to @lab, notice: 'Lab was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab }
      else
        format.html { render :edit }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @lab.destroy
    respond_to do |format|
      format.html { redirect_to labs_url, notice: 'Lab was successfully destroyed.' }
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


  def set_lab
    @lab = Lab.find(params[:id])
  end


  def lab_params
    params.require(:lab).permit(:name,:nickname,:info,:start_date,:end_date)
  end



end