class CommentsController < ApplicationController
  before_action :find_and_set_project

  def new
    @comment = @obstacle.comments.new
  end

  def create
    @comment = @obstacle.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to step_obstacle_path(@obstacle.step.id, @obstacle)
    else
      redirect_to step_obstacle_path(@obstacle.step.id, @obstacle)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:message, :user_id, :obstacle_id)
  end

  def find_and_set_project
    @obstacle = Obstacle.find(params[:obstacle_id])
  end

end
