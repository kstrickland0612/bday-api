class FriendsController < ProtectedController
  # switch to ProtectedController after testing
  before_action :set_friend, only: [:show, :update, :destroy]

  # GET /friends
  def index
    @friends = current_user.friends.all
    # @friends = Friend.all

    render json: @friends
  end

  # GET /friends/1
  def show
    render json: @friend
  end

  # POST /friends
  def create
    @friend = current_user.friends.build(friend_params)
    # @friend = Friend.new(friend_params)

    if @friend.save
      render json: @friend, status: :created, location: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      render json: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = current_user.friends.find(params[:id])
      # @friend = Friend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :dob)
    end
end
