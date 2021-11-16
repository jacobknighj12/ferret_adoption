class ApplicationController < ActionController::Base

    include Pundit
    # config.to_prepare do
    #     Devise::SessionsController.layout "configure_permitted_parameters"
    #   end
    before_action :current_user
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
