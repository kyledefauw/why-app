class RenameGoals < ActiveRecord::Migration
  def change
    rename_table :goals, :steps
  end
end
