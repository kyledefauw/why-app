class AddStepIdToObstacles < ActiveRecord::Migration
  def change
    add_column :obstacles, :step_id, :integer
  end
end
