# Listing and managing Employees
class Admin::EmployeesController < AdminController
  before_action :authenticate_user!

  def index
    @employees = Employee.all
  end

  


end
