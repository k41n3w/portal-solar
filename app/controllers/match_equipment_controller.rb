class MatchEquipmentController < ApplicationController
  def index
    return redirect_to new_user_registration_path if current_user.nil?

    @power_generators = PowerGenerator.find_principal_generators(current_user)
    @perfect_match = PowerGenerator.find_perfect_match(current_user, @power_generators)

    @q = @power_generators.ransack(params[:q])
    @q = @perfect_match.ransack(params[:q])
  end
end
