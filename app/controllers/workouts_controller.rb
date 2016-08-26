class WorkoutsController < ApplicationController

  def index
    if current_user
      @workouts = current_user  
    else
      redirect_to new_user_session_path, notice: "You are not logged in"
    end
  end

  def new
  end

  def create
    @workout = Workout.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    gender: params[:gender],
    partner_gender: params[:partner_gender],
    image: params[:image],
    age: params[:age],
    relationship_status: params[:relationship_status],
    user_exp: params[:user_exp],
    gym: params[:gym],
    bio: params[:bio]
    )
  end
end


# How do I make my page redirect to sign up page once the user logs out?
