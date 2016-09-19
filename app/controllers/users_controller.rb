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
  end
end
