class ApplicationController < ActionController::Base
  # Allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit name attribute for sign-up and account update actions
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :avatar ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :avatar ])
  end
end
