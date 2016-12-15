class EmployeeApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_application, only: [:edit,:show]
  # before_action :set_camp, only: [:new, :index]

  def new
    # unless current_user.account.accountable_type == 'Employee'
    #   current_user.account.accountable = Employee.new
    # end
    # @employee = current_user.account.accountable

    # @application = EmployeeApplication.new(camp: @camp, employee: @employee)

    unless current_user.account
      current_user.account = Account.new
      current_user.account.accountable = Employee.new
    end

    @application = EmployeeApplication.new
    console
  end

  def edit
  end

  def show
  end

  def create
    @employee_application = EmployeeApplication.new(employee_application_params)
    @employee_application.employee = current_user.account
    respond_to do |format|
      if @employee_application.save
        format.html { redirect_to view_employee_application, notice: 'We\'ve received your application!' }
        format.json { render :show, status: :created, location: @employee_application }
      else
        format.html { render :new }
        format.json { render json: @employee_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  private

  def set_employee_application
    @employee_application = EmployeeApplication.find(params[:id])
  end

  def set_camp
    @camp = Camp.find_by(nickname: params[:camp_nickname])
  end

  def employee?
    case current_user.account.accountable
    when Employee
      @employee = current_user.account.accountable
    when nil
      redirect_to new_account_path
    else
      flash[:alert] = "You're not an employee!"
      redirect_to root_path
    end

  end

  def employee_application_params
    params.require(:employee_application)
          .permit(:program_id)# , :employee_attributes[:pronouns,
                              #                     :arrival_date,
                              #                     :leave_date,
                              #                     :bio,
                              #                     :references,
                              #                     :experience])
  end
end
