require 'correios-cep'

class PowerGeneratorsController < ApplicationController
  before_action :set_power_generator, only: %i[show]
  before_action :set_power_generators, only: %i[index]

  def index
  end

  def show
    unless params[:cep].nil?
      finder = Correios::CEP::AddressFinder.new
      address = finder.get(params[:cep])

      @cost = Freight.where(state: address[:state])
      @cost = @cost.where("weight_max >= ?", @power_generator.weight).first
    end
  end

  private

  def set_power_generator
    @power_generator = PowerGenerator.find(params[:id])
  end

  def set_power_generators
    @power_generators = PowerGenerator.all
  end
end
