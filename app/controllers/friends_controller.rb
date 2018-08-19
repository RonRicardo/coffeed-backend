class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index
    current_user = User.find(params[:user_id])
    #modify line 5 after you start using devise
    @friends = current_user.friends
    render json: @friends
  end

  def destroy
    current_user.remove_friend(@friend)
    # head :no_content
    render json: {
      status: 200,
      message: "Successfully deleted friend",
    }
  end

  private
    def set_friend
      @friend = current_user.friends.find(params[:friend_id])
    end
end
