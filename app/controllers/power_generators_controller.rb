class PowerGeneratorsController < ApplicationController
  before_action :set_power_generator, only: %i[show]
  before_action :set_power_generators, only: %i[index]

  def index
  end

  def show
  end

  private

  def set_power_generator
    @power_generator = PowerGenerator.find(params[:id])
  end

  def set_power_generators
    @power_generators = PowerGenerator.all
  end
end
