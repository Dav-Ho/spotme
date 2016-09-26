class WorkoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:welcome]
  def welcome
  end

  def index
    User.all
  end

  def new
  end
end

# How do I make my page redirect to sign up page once the user logs out?
