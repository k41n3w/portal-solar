require 'correios-cep'

class PowerGeneratorsController < ApplicationController
  before_action :set_power_generator, only: %i[show]

  def index
  end

  def show
    unless params[:cep].nil?
      return if params[:cep].size < 9
      
      finder = Correios::CEP::AddressFinder.new
      address = finder.get(params[:cep])

      @cost = Freight.where(state: address[:state])

      bigger = @power_generator.cubage if @power_generator.cubage < @power_generator.weight
      bigger = @power_generator.weight if @power_generator.weight < @power_generator.cubage
  
      @cost = @cost.where("weight_max >= ?", bigger).first
    end
  end

  private

  def set_power_generator
    @power_generator = PowerGenerator.find(params[:id])
  end
end
