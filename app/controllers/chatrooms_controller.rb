class ChatroomsController < ApplicationController
  def new
    @chatrooms = Chatroom.limit(10)
    @users = current_user.following
    # @users = User.find_by(id: current_user.id)
  end

  def create
    @chatroom = Chatroom.create(current_user_id: current_user.id, user_id: params[:user_id])
    redirect_to "/chatrooms/#{@chatroom.id}"
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    user_id = @chatroom.current_user_id == current_user.id ? @chatroom.user_id : @chatroom.user_id
    @user = User.find_by(id: user_id)
  end
end
