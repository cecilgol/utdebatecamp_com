class Admin::EventsController < AdminController
  before_action :require_admin
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new(start_date: params.fetch('date'))
    respond_to(:js,:html) 
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    
    #this is fucking nasty but what you want?
    date = event_params.fetch('start_date').to_time.change({hour:params.fetch('start_time').split(':')[0].to_i,min:params.fetch('start_time').split(':')[1].to_i})

    @event.schedule = IceCube::Schedule.new(date).to_hash

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
        format.js { render :show, notice: 'Event was successfully updated.'}

      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }

      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # RETURN THE PROGRAMS FOR ANY CAMP
  def camp_id_program
    respond_to(:js)
    @programs = Program.where(camp: params['campId'])
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :camp_id, :program_id, :start_date, :start_time, :end_time)
    end
end
