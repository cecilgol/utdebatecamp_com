class Admin::ProgramsController < AdminController
  before_action :authenticate_user!

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
  
  private
  def program_params
    params.require(:program).permit(:camp_id,:name,:info,:nickname,:price,:start_date,:end_date,:old_link)
  end


end
