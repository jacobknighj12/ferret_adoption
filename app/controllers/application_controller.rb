class ApplicationController < ActionController::Base
    before_action :current_user
    def current_user
        # if [:user.id]
        # @current_user ||= User.find([:user.id])
        # else
        #     @current_user = nil
        # end
        # current_user = User.find()
        @current_user = User.find_by(id: params[:id])
    end
end
