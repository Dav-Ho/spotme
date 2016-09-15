class MatchesController < ApplicationController
  def self.all_except(user)
    where.not(id: user)
  end

  def index
    # @users = User.all.where(, current_user.id)
    if current_user.partner_gender == "Male & Female"
      search_gender = ["male", "female"]
    else
      search_gender = current_user.partner_gender
    end
    puts search_gender
    @users = User.where(gender: search_gender ).where.not(id: current_user.id)
    # state: current_user.state)
  end

  def show
    @users = User.find_by(id: params[:id])
  end
end
