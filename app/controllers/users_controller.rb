class UsersController < ApplicationController
  def following
    @user = User.find_by(id: params[:id])
  end

  def followers
    @user = User.find_by(id: params[:id])
  end
end
