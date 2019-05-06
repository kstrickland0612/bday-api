class EventsController < ProtectedController
  # switch to ProtectedController after testing
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = current_user.events.all
    # @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)
    # @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @friend
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1

    # having an issue where an event can be patched to a friend owned by another user. This does not affect front-end functionality.

    # Trying to fix this by checking to see if the friend_id in the update request is owned by the current user
      # if not owned by the current user (returns nil), update all params except the friend_id so that friend_id never changes
      # otherwise, business as usual
        # event_params are updated
        # or if there's an error, the status unprocessable entity is returned

    # if this solution doesn't work, need to reorganize schema a bit so that events do not have user foreign key and so that events are a nested resource under friends.

    # binding.pry

  #   @friend = current_user.friends.find(event_params[:friend_id])
  #   if @friend.nil?
  #     if @event.update(event_params.except(:friend_id))
  #       render json: @event
  #     end
  #   elsif @event.update(event_params)
  #     render json: @event
  #   else
  #     render json: @event.errors, status: :unprocessable_entity
  #   end
  # end

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
      @event = current_user.events.find(params[:id])
      # @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:title, :category, :date, :action, :friend_id, :user_id)
    end
end
