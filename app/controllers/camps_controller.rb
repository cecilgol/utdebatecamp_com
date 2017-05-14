class CampsController < ApplicationController

  before_action :set_camp, only: [:show,:staff] #, :edit, :update, :destroy, :sign_up, :apply_to_work]
  def show
    if !@camps
      @camps = Camp.all
    end
    
  end

  def staff
    @employees = Employee.where(camp: @camp,is_hired: true)
  end
  private
    def set_camp
      @camp = Camp.find_by(nickname: params[:camp_nickname])
    end


end
