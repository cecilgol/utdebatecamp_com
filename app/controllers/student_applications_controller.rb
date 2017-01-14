class StudentApplicationsController < ApplicationController
  before_action :set_student_application, only: [:show, :edit, :update, :destroy]



  def index
    @student_applications = StudentApplication.all
  end



  def show
  end


  def new
    @student_application = StudentApplication.new
  end


  def edit
  end



  def create
    @student_application = StudentApplication.new(student_application_params)

    respond_to do |format|
      if @student_application.save
        format.html { redirect_to @student_application, notice: 'Student application was successfully created.' }
        format.json { render :show, status: :created, location: @student_application }
      else
        format.html { render :new }
        format.json { render json: @student_application.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @student_application.update(student_application_params)
        format.html { redirect_to @student_application, notice: 'Student application was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_application }
      else
        format.html { render :edit }
        format.json { render json: @student_application.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @student_application.destroy
    respond_to do |format|
      format.html { redirect_to student_applications_url, notice: 'Student application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_student_application
      @student_application = StudentApplication.find(params[:id])
    end


    def student_application_params
      params.fetch(:student_application, {})
    end
end
