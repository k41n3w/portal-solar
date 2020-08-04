class MatchEquipmentController < ApplicationController
  def index
    return redirect_to new_user_registration_path if current_user.nil?

    @power_generators = PowerGenerator.find_principal_generators(current_user)

    @perfect_match = PowerGenerator.find_max_value(current_user.question_4, 'price', @power_generators)
    @perfect_match = PowerGenerator.find_max_value(current_user.question_5, 'weight', @perfect_match)
    @perfect_match = PowerGenerator.find_max_value(current_user.question_6, 'kwp', @perfect_match)

    @perfect_match = PowerGenerator.find_structure_type(current_user.question_7, @perfect_match)

    page = params[:page] || 1

    @q = @power_generators.ransack(params[:q])
    @q = @perfect_match.ransack(params[:q])
  end
end
