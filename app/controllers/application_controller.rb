class ApplicationController < ActionController::Base
    include Pundit
    config.to_prepare do
        Devise::SessionsController.layout "configure_permitted_parameters"
      end
      before_action :current_user

    
    # def current_user
    #     if [:user.id]
    #     @current_user ||= User.find([:user.id])
    #     else
    #         @current_user = nil
    #     end
    #     # current_user = User.find()
    #     @current_user = User.find_by(id: params[:id])
    # end
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
