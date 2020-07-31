class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :question_1, :question_2, :question_3, :question_4, :question_5, :cep) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :question_1, :question_2, :question_3, :question_4, :question_5, :cep) }
  end
end
