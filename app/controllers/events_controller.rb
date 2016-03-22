class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_local, only: [:show, :edit, :update, :destroy, :index,:new, :create]
  # REFACT check where set local is necessary

  # GET /events
  # GET /events.json
  def index
    @events = @local.events.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = @local.events.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = @local.events.new(event_params)

    if @event.save
      redirect_to [@local,@event], notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update

    if @event.update(event_params)
      redirect_to [@local,@event], notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    redirect_to local_events_path(@local), notice: 'Event was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

  def set_local
    @local = Local.find(params[:local_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :start_t, :end_t)
    end
end
