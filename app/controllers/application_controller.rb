class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    questions_path
  end

  def owner?(object:)
    object.user == current_user
  end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:user_name, :email, :password, :password_confirmation]

    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end
end
