class UsersController < ApplicationController
  def following
    @title = "Following"
    @user = User.find_by(id: params[:id])
  end

  def followers
    @title = "Followers"
    @user = User.find_by(id: params[:id])
  end

  def show
  @user = User.find_by(id: params[:id])
    if current_user.id == params[:id].to_i
      @hide_follow_button = true
    else
      @hide_follow_button = false
    end
  end
end
