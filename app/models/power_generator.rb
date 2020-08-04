class PowerGenerator < ApplicationRecord
  validates :name, :description, :image_url, :manufacturer, :price, :kwp, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 40 }
  validates :width, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :lenght, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000 }

  enum structure_type: %i[
    metalico
    ceramico
    fibrocimento
    laje
    solo
    trapezoidal
  ]

  def self.find_principal_generators(current_user)
    @power_generators = PowerGenerator.all

    all_anwers = []
    all_anwers << current_user.question_1
    all_anwers << current_user.question_2
    all_anwers << current_user.question_3

    all_anwers.each do |answer|
      @power_generators = @power_generators.where("description ILIKE ?", "%#{answer}%")
    end

    @power_generators
  end

  def self.find_max_value(answer, attribute, power_generators)
    max_value = answer.delete('.').to_f
  
    power_generators.where("#{attribute} <= ?", max_value)
  end

  def self.find_structure_type(answer, perfect_match)
    perfect_match.where(structure_type: answer)
  end

  def self.validate_cep(cep)
    cep && cep.size == 9
  end

  def self.find_cep(cep)
    finder = Correios::CEP::AddressFinder.new
    finder.get(cep)
  end

  def self.find_cost(power_generator, address)
    cost = Freight.where(state: address)
    smaller = [power_generator.cubage, power_generator.weight].min

    cost.where("weight_max >= ?", smaller).first
  end
end