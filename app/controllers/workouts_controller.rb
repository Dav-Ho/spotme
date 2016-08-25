class WorkoutsController < ApplicationController

  def index
  end

  def new
    @workout = Workout.new
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


# How do I make my page redirect to sign up page once the user logs out?
