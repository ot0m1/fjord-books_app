# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[postal_code address self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[postal_code address self_introduction])
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end
end
