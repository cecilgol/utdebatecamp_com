class EmployeeApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_application, only: [:edit,:show]
  before_action :set_camp, only: [:new,:index]

  def new
  end

  def edit
  end

  def show
  end

  def index
    @employee_applications = EmployeeApplication.all
  end

  def create
  end

  def update
  end

  private

  def set_employee_application
    @employee_application = EmployeeApplication.find(params[:id])
  end

  def set_camp
    @camp = Camp.find_by(nickname: params[:camp_nicnkame])
  end
end
