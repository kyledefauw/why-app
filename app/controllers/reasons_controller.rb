class ReasonsController < ApplicationController

  before_action :find_and_set_reason

  def index
    @reasons = @life_venture.reasons.all
  end

  def new
    @reason = @life_venture.reasons.new
  end

  def create
    @reason = @life_venture.reasons.new(reason_params)
    if @reason.save
      flash[:notice] = 'Reason successfully created'
      redirect_to life_venture_reasons_path
    else
      render :new
    end
  end

  def edit
    @reason = @life_venture.reasons.find(params[:id])
  end

  def show
    @reason = @life_venture.reasons.find(params[:id])
  end

  def update
    @reason = @life_venture.reasons.find(params[:id])
    if @reason.update(reason_params)
      flash[:notice] = 'Reason Successfully updated!'
      redirect_to life_venture_reason_path(@life_venture, @reason)
    else
      render :edit
    end
  end

  def destroy
    reason = @life_venture.reasons.find(params[:id])
    reason.destroy
    flash[:error] = "Reason was deleted"
    redirect_to life_venture_reasons_path
  end

  private

  def reason_params
    params.require(:reason).permit(:name, :priority, :life_venture_id)
  end

  def find_and_set_reason
    @life_venture = LifeVenture.find(params[:life_venture_id])
  end

end
