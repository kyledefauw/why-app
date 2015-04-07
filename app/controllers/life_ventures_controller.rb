class LifeVenturesController < ApplicationController

  def index
    @life_ventures =
      if current_user
        LifeVenture.where(user_id: current_user.id)
      else
        []
      end
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
     life_venture.destory
     flash[:error] = "Life Venture was deleted"
     redirect_to life_ventures_path
   end

  private

  def life_venture_params
    params.require(:life_venture).permit(:name, :category)
  end

end
