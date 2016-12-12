class Admin::ProgramsController < AdminController
  before_action :authenticate_user!

  def index
    @programs = Program.all
  end

  


end
