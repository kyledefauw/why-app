class GoalsController < ApplicationController

  before_action :find_and_set_goal

  def index
    @goals = LifeVenture.goals.all
  end

  def new
    @goal = LifeVenture.goals.new
  end

  def create
    @goal = LifeVenture.goals.new(goal_params)
    if @goal.save
      flash[:notice] = "Goal successfully created"
      redirect_to life_venture_goal_path(@life_venture, @goal)
    else
      render :new
    end
  end

  def edit
    @goal = LifeVenture.goals.find(params[:id])
  end

  def show
    @goal = LifeVenture.goals.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash[:notice] = "Goal successfully updated"
      redirect_to life_venture_goals_path
    else
      render :edit
    end
  end

  def destroy
    goal = LifeVenture.goals.find(params[:id])
    goal.destroy
    flash[:error] = "Goal was deleted"
    redirect_to life_venture_goals_path
  private

  def goal_params
    params.require(:goal).permit(:name, :due_date, :life_venture_id)
  end

  def find_and_set_goal
    @life_venture = LifeVenture.find(params[:life_venture_id])
  end

end
