class StepsController < ApplicationController

  before_action :find_and_set_step

  def index
    @steps = LifeVenture.steps.all
  end

  def new
    @step = LifeVenture.steps.new
  end

  def create
    @step = LifeVenture.steps.new(step_params)
    if @step.save
      flash[:notice] = "Goal successfully created"
      redirect_to life_venture_step_path(@life_venture, @step)
    else
      render :new
    end
  end

  def edit
    @step = LifeVenture.steps.find(params[:id])
  end

  def show
    @step = LifeVenture.steps.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      flash[:notice] = "step successfully updated"
      redirect_to life_venture_steps_path
    else
      render :edit
    end
  end

  def destroy
    step = LifeVenture.steps.find(params[:id])
    step.destroy
    flash[:error] = "Step was deleted"
    redirect_to life_venture_steps_path
  end

  private

  def step_params
    params.require(:step).permit(:name, :due_date, :life_venture_id)
  end

  def find_and_set_step
    @life_venture = LifeVenture.find(params[:life_venture_id])
  end

end
