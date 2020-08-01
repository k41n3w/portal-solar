class MatchEquipmentController < ApplicationController
  def index
    return redirect_to new_user_registration_path if current_user.nil?
    
    find_principal_answers
    
    find_max_value(current_user.question_4, 'price')
    find_max_value(current_user.question_5, 'weight')
    find_max_value(current_user.question_6, 'kwp')

    find_structure_type(current_user.question_7)
  end
end
