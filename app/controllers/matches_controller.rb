class MatchesController < ApplicationController

  def self.all_except(user)
    where.not(id: user)
  end

  def index
    @users = User.where(recommended_search_criteria).where.not(id: current_user.id).
    joins(:activities).where(activities: {name: current_user.activities.map(&:name)}).distinct
  end

  def search
    @users = User.where(age: convert_to_range, user_exp: params[:user_exp]).where.not(id:current_user.id)
    @users = @users.where(gender: gender_search)
    @users = @users.joins(:activities).where(activities:{name: activity_search}) if params[:activities]
    render 'index'
  end

  def activity_search
    Activity.where(id: params[:activities]).map(&:name)
  end

  def convert_to_range
    params[:age].split('..').inject {|s,e| s.to_i..e.to_i }
  end

  def gender_search
    return ["male", "female"] if params[:male] == "1" && params[:female] == "1"
    return ["male"] if params[:male] == "1"
    return ["female"] if params[:female] == "1"
    return ""
  end
    # Activities
    # zipcode & mile radius
    # Ages
    # Gym
    # Experience
    # Preferred Gender
  
  def recommended_search_criteria
    {
      age: age_range,
      state: current_user.state,
      # user_exp: current_user.user_exp,
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
