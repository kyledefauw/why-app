class LifeVenturesController < ApplicationController

  def index
    @life_ventures = LifeVenture.all
  end

  def new
    @life_venture = LifeVenture.all
  end

  def create
    @life_venture = LifeVenture.new(life_venture_params)
  end

  private

  def life_ventures_params
    params.require(:life_venture).permit(:name, :category)

end
