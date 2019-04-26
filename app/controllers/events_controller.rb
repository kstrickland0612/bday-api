class EventsController < ApplicationController
  # switch to ProtectedController after testing
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    # @events = current_user.events.all (switch back to this after testing)
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    # @event = current_user.events.build(event_params) (switch back to this after testing)
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      # @event = current_user.events.find(params[:id]) (switch back to this after testing)
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:title, :category, :date, :action, :friend_id)
    end
end
