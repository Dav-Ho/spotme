class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protected

  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation,
    :remember_me, :zip_code, :state, :city, :first_name, :last_name, :gender,
    :partner_gender, :age, :relationship_status, :photo,
    :user_exp, :gym, :bio, :user_activities]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
end
