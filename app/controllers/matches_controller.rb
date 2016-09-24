class MatchesController < ApplicationController

  def self.all_except(user)
    where.not(id: user)
  end

  def index
    @users = User.where(recommended_search_criteria).where.not(id: current_user.id).
    joins(:activities).where(activities: {name: current_user.activities.map(&:name)}).distinct
  end

  def search
    @users = User.where(age: age)
  end

  def recommended_search_criteria
    # Activities
    # zipcode & mile radius
    # Ages
    # Gym
    # Experience
    # Preferred Gender
    {
      # zipcode: #5 mile radius of current user zip code
      age: age_range,
      state: current_user.state,
      # gym: current_user.gym,
      user_exp: current_user.user_exp,
      gender: current_user.partner_gender
    }
  end

  def age_range
    if current_user.age < 26
      return (18..25)
    elsif current_user.age < 31
      return (26..30)
    elsif current_user.age < 41
      return (31..40)
    elsif current_user.age < 51
      return (41..50)
    elsif current_user.age < 61
      return (51..60)
    else
      return (61..70)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
