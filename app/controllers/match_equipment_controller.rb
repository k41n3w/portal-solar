class MatchEquipmentController < ApplicationController
  def index
    return redirect_to new_user_registration_path if current_user.nil?

    @power_generators = PowerGenerator.all

    all_anwers = []
    all_anwers << current_user.question_1
    all_anwers << current_user.question_2
    all_anwers << current_user.question_3

    all_anwers.each do |answer|
      @power_generators = @power_generators.where("description ILIKE ?", "%#{answer}%")
    end

    less_important_questions
  end
 
  def less_important_questions
    question_4_method(current_user.question_4.split)
    question_5_method(current_user.question_5.split)
  end

  def question_4_method(answers)
    initial_price_value = answers.first.split(',00').first.delete('.').to_f
    final_price_value = answers.third.split(',00').first.delete('.').to_f
    
    answers_4 = [initial_price_value, final_price_value]

    answer_4_generators = @power_generators.where("price > ? AND price < ?", answers_4.first, answers_4.second)
    @power_generators = answer_4_generators if answer_4_generators.count > 0
  end

  def question_5_method(answers)
    initial_weight_value = answers.first
    final_weight_value = answers.third
    
    answers_5 = [initial_weight_value, final_weight_value]

    answer_5_generators = @power_generators.where("weight > ? AND weight < ?", answers_5.first, answers_5.second)
    @power_generators = answer_5_generators if answer_5_generators.count > 0
  end
end
