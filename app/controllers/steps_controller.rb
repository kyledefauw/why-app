class StepsController < ApplicationController

  before_action :find_and_set_step

  def index
    @steps = @life_venture.steps
  end

  def new
    @step = @life_venture.steps.new
  end

  def create
    @step = @life_venture.steps.new(step_params)
    if @step.save
      flash[:notice] = "Step successfully created"
      redirect_to life_venture_steps_path
    else
      render :new
    end
  end

  def edit
    @step = @life_venture.steps.find(params[:id])
  end

  def show
    @step = @life_venture.steps.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      flash[:notice] = "Step successfully updated"
      redirect_to life_venture_steps_path
    else
      render :edit
    end
  end

  def destroy
    step = @life_venture.steps.find(params[:id])
    step.destroy
    flash[:error] = "Step was deleted"
    redirect_to life_venture_steps_path(@life_venture)
  end

  private

  def step_params
    params.require(:step).permit(:name, :due_date, :life_venture_id)
  end

  def find_and_set_step
    @life_venture = LifeVenture.find(params[:life_venture_id])
  end

end
