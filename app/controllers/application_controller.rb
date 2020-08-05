# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_power_generators

  # :nocov:
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :question_7) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :question_7) }
  end
  # :nocov:

  def set_power_generators
    page = params[:page] || 1

    @q = PowerGenerator.ransack(params[:q])

    @power_generators = @q.result(distinct: true).paginate(page: page, per_page: 6)
  end
end
