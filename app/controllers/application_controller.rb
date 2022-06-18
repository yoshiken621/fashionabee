class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    elsif resource_class == Adviser
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    else
      super
    end
  end
end
