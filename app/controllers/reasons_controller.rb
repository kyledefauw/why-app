class ReasonsController < ApplicationController

  def index
    @reasons = Reason.all
  end

  def new
    @reason = Reason.new
  end

  def create
    @reason = Reason.new(reason_params)
    if @user.save
      flash[:notice] = 'Reason successfully created'
      redirect_to
  end

end
