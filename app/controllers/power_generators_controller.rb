require 'correios-cep'

class PowerGeneratorsController < ApplicationController
  before_action :set_power_generator, only: %i[show]

  def index
  end

  def show
    if (PowerGenerator.validate_cep(params[:cep]) == true && params[:cep] != nil)
      @address = PowerGenerator.find_cep(params[:cep])

      @cost = PowerGenerator.find_cost(@power_generator, @address[:state])
    end
  end

  private

  def set_power_generator
    @power_generator = PowerGenerator.find(params[:id])
  end
end
