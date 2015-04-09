class ObstaclesController < ApplicationController

  before_action :find_and_set_obstacle

  def index
    @obstacles = @step.obstacles.all
  end

  def new
    @obstacle = @step.obstacles.new
  end

  def create
    @obstacle = @step.obstacles.new(obstacle_params)
    if @obstacle.save
      flash[:notice] = "Obstacle successfully added"
      redirect_to = step_obstacles_path(@step, @obstacle)
    else
      render :new
    end
  end

  def show
    @obstacle = @step.obstacles.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @obstacle = @step.obstacles.find(params[:id])
  end

  def update
    @obstacle = @step.obstacles.find(params[:id])
    if @obstacle.update(obstacle_params)
      flash[:notice] = 'Obstacle was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    obstacle = @step.obstacles.find(params[:id])
    obstacle.destroy
    flash[:error] = 'Obstacle was deleted'
  end

  private

  def obstacle_params
    params.require(:obstacle).permit(:name, :step_id)
  end

  def find_and_set_obstacle
    @step = Step.find(params[:step_id])
  end

end
