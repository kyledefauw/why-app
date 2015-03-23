class AddColumnToGoalsTable < ActiveRecord::Migration
  def change
    add_column :goals, :life_venture_id, :integer
  end
end
