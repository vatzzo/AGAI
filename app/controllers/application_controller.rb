class ApplicationController < ActionController::Base
    include Pagy::Backend

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end

    def authenticate_admin!
        redirect_to root_path unless current_user.is_admin
    end
end
