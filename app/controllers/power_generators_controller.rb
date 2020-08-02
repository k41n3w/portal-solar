require 'correios-cep'

class PowerGeneratorsController < ApplicationController
  before_action :set_power_generator, only: %i[show]

  def index
    page = params[:page] || 1

    @q = PowerGenerator.ransack(params[:q])

    @power_generators = @q.result(distinct: true).paginate(page: page, per_page: 6)
  end

  def show
    unless params[:cep].nil?
      return if params[:cep].size < 9
      
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
end
