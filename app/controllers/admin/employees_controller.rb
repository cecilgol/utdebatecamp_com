# Listing and managing Employees
class Admin::EmployeesController < AdminController
  before_action :authenticate_user!
  before_action :set_employee, only: [:edit]

  def index
    console
    @employees = Employee.all.select{|e| e.account && e.account.accountable_type == "Employee"}
    # @bad_employees = Array.new
    # employees.each do |e|
    #   unless e.account && e.account.accountable_type == "Employee"
    #     console
    #     employees.delete!(e)
    #     @bad_employees << e
    #   end
    # end
    # @employees = employees
    
  end

  def edit
  end


  private
  
  def set_employee
    @employee = Employee.find(params[:id])
  end
end
