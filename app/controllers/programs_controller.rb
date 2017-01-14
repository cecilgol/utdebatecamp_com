class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  









  def show
  end


  def new
    @program = Program.new
    @camps = Camp.all.map {|camp|[camp.nickname,camp.id]}
  end


  def edit
  end



  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


  def set_program
    @program = Program.find(params[:id])
  end


  def program_params
    params.fetch(:program, {})
          .permit(:name, :nickname, :start_date, :end_date, :info, :price, :camp_id)
  end
end
