# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :name, :surname, :workgroup])
      params.require(:user).permit(:name, :surname, :workgroup, :email, :password, :password_confirmation)
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute, :name, :surname, :workgroup])
    end

    def after_sign_up_path_for(_resource)
      current_user.admin? ? admin_welcome_path : search_path
    end
  end
end
