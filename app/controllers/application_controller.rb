class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  
  
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:account_update) << :avatar
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:account_update) << :bio
  end
  def after_sign_in_path_for(resource)
    stored_location_for(:user) || dashboard_path
  end

  private

  def after_sign_out_path_for(resource)
    stored_location_for(:user) || root_path
  end
  
end
