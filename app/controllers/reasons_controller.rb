class ReasonsController < ApplicationController

  def index
    @reasons = @life_venture.reasons
  end

  def new
    @reason = @life_venture.reasons.new
  end

  def create
    @reason = @life_venture.reasons.new(reason_params)
    if @reason.save
      flash[:notice] = 'Reason successfully created'
      redirect_to
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
      flash[:notice] = 'Reason Successfully added!'
      redirect_to life_venture_reasons_path
    else
      render :edit
    end
  end

  def destroy
    reason = @life_venture.reason.find(params[:id])
    reason.destroy
    redirect_to life_venture_reasons_path
  end

  private

  def reason_params
    params.require(:reason).permit.(:name, :priority, :life_venture_id)
  end

end
