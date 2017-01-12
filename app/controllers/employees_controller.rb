class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, except: [:new,:create]

  def new
    @employee = Employee.new
    # current_user.account ||= Account.new   
    # @employee.account = current_user.account
  end


  def create
    @employee = Employee.new(employee_params)
    current_user.account ||= Account.new(account_params)
    @account = current_user.account
    
    @employee.account = @account

    respond_to do |format|
      if @employee.save
        EmployeeMailer.welcome_email(@employee).deliver_now
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    redirect_to action: :edit
  end
  def edit
    @account = @employee.account
  end
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.where(account: current_user.account.id).first
  end

  def is_employee
    unless current_user.account.employee?
      redirect_to root_path flash[:error] = 'You\'re not an employee!'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit(:camp_id,:program,:pronouns,:arrival_date,:leave_date,:bio,:dorm,:eid,:references,:experience,:avatar)
  end
  def account_params
    params.require(:account).permit(:first_name,:middle_name,:last_name,:cell_phone,:carrier,:address1,:address2,:city,:state,:zipcode,:birthday)
  end
end
