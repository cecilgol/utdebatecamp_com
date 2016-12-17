class Admin::ProgramsController < AdminController
  before_action :authenticate_user!
  before_action :set_program, only: [:edit,:show,:destroy,:update]

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    
    respond_to do |format|
      if @program.save
        flash[:notice] = 'Program was successfully created.'
        format.html { admin_programs_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    redirect_to action: :edit
  end

  def edit

  end

  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to admin_program_path(@program.id), notice: 'program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to admin_programs_path, notice: 'program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  def set_program
    @program = Program.find(params[:id])
  end
  def program_params
    params.require(:program).permit(:camp_id,:name,:info,:nickname,:price,:start_date,:end_date,:old_link)
  end


end
