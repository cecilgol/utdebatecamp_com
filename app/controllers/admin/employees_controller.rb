# Listing and managing Employees
class Admin::EmployeesController < AdminController
  before_action :authenticate_user!
  before_action :set_employee, only: [:edit,:update,:hire,:destroy]

  def index
    @employees = Employee.all
  end

  def hired
    @employees = Employee.where(is_hired: true)
  end

  def not_hired
    @employees = Employee.where(is_hired: false)
  end

  def edit
  end

  def hire
    @employee.hire
    respond_to do |format|
      format.js {render 'hired.js'}
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @employee.account.update(account_params)
        flash[:notice] = "Updated #{@employee.account.first_name} #{@employee.account.last_name}'s personal information."
      end

      if @employee.update(employee_params)
        format.html {redirect_to admin_employees_path, notice: "Updated #{@employee.account.first_name} #{@employee.account.last_name}'s personal information."}
      else
        format.html {redirect_to edit_admin_employee_path(@employee.id)}
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to admin_employees_path, flash[:notice]= 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:camp_id, :program_id, :account_id, :title, :arrival_date, :leave_date, :bio, :pronouns, :dorm, :eid, :is_hired, :compensation, :references, :experience, :avatar)
  end
  def account_params
    params.require(:account).permit(:first_name,:middle_name,:last_name,:cell_phone,:carrier,:address1,:address2,:city,:state,:zipcode,:birthday)
  end
  def set_employee
    @employee = Employee.find(params[:id])
  end
end
