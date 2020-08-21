class ApplicationController < ActionController::Base
  before_action :move_to_index, except: [:show, :new,:create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :remenber_created_at, :created_at, :updated_at])
  end
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
