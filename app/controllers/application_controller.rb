class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def find_principal_answers
    @power_generators = PowerGenerator.all

    all_anwers = []
    all_anwers << current_user.question_1
    all_anwers << current_user.question_2
    all_anwers << current_user.question_3

    all_anwers.each do |answer|
      @power_generators = @power_generators.where("description ILIKE ?", "%#{answer}%")
    end
  end

  def find_max_value(answer, attribute)
    max_value = answer.delete('.').to_f
  
    answers = @power_generators.where("#{attribute} <= ?", max_value)

    @perfect_match = answers
  end

  def find_structure_type(answer)
    answers = @perfect_match.where(structure_type: answer)

    @perfect_match = answers
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :question_7) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :question_7) }
  end
end
