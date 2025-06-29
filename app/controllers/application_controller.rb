class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb

    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name])
  end
end
