# Listing and managing Employees
class Admin::EmployeesController < AdminController
  before_action :authenticate_user!
  before_action :set_employee, only: [:edit,:hire,:destroy]

  def index
    @employees = Employee.all
  end

  def hired
    @employees = Employee.where("is_hired = 1")
  end

  def not_hired
    @employees = Employee.where("is_hired = 0")
  end

  def edit
  end

  def hire
    @employee.hire
    respond_to do |format|
      format.js {render 'hired.js'}
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to admin_employees_path, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def set_employee
    @employee = Employee.find(params[:id])
  end
end
