class Admin::StudentsController < AdminController
  before_action :set_admin_student, only: [:show, :edit, :update, :destroy]

  # GET /admin/students
  # GET /admin/students.json
  def index
    @admin_students = Student.all
  end

  # GET /admin/students/1
  # GET /admin/students/1.json
  def show
  end

  # GET /admin/students/new
  def new
    @admin_student = Student.new
  end

  # GET /admin/students/1/edit
  def edit
  end

  # POST /admin/students
  # POST /admin/students.json
  def create
    @admin_student = Student.new(admin_student_params)

    respond_to do |format|
      if @admin_student.save
        format.html { redirect_to @admin_student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @admin_student }
      else
        format.html { render :new }
        format.json { render json: @admin_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/students/1
  # PATCH/PUT /admin/students/1.json
  def update
    respond_to do |format|
      if @admin_student.update(admin_student_params)
        format.html { redirect_to @admin_student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_student }
      else
        format.html { render :edit }
        format.json { render json: @admin_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/students/1
  # DELETE /admin/students/1.json
  def destroy
    @admin_student.destroy
    respond_to do |format|
      format.html { redirect_to admin_students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_student
      @admin_student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_student_params
      params.fetch(:admin_student, {})
    end
end
