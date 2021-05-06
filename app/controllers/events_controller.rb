class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show showcase expireds]
  # GET /events or /events.json
  def index
    @events = Event.future.order(:date)
  end

  def expireds
    @events = Event.expired
  end

  def showcase
    @events = Event.last(3)
  end

  # GET /events/1 or /events/1.json
  def show
    if @event.attendees.count.to_i < @event.attend_limit.to_i
      @attendee = Attendee.new
      end
      @attender = Attendee.where(user_id: current_user.id, event_id: @event.id, will_join: true).first
      @attendee_count = @event.attendees.where(will_join: true).count
      @attendee_list = @event.attendees.all.where(will_join: true)
      if user_signed_in?
        @will_join = Attendee.where(user_id: current_user.id, event_id: @event.id, will_join: true).any? ? true : false
      end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :location, :description, :date, :user_id, :attend_limit)
    end
end
