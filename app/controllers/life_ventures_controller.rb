class LifeVenturesController < ApplicationController

  def index
    @life_ventures = LifeVenture.all
  end

  def new
    @life_venture = LifeVenture.new
  end

  def create
    @life_venture = LifeVenture.new(life_venture_params)
    if @life_venture.save
      flash[:notice] = 'Congrats on adding a new life venture!'
      redirect_to life_ventures_path
    else
      render :new
    end
   end

   def edit
     @life_venture = LifeVenture.find(params[:id])
   end

   def show
     @life_venture = LifeVenture.find(params[:id])
   end

   def update
     @life_venture = LifeVenture.find(params[:id])
     if @life_venture.update(life_venture_params)
       flash[:notice] = 'Venture successfully updated'
       redirect_to life_ventures_path
     else
       render :edit
     end
   end

   def destroy
     life_venture = LifeVenture.find(params[:id])
     life_venture.delete
     redirect_to life_ventures_path, notice: 'Life venture deleted'
   end

  private

  def life_venture_params
    params.require(:life_venture).permit(:name, :category)
  end

end
