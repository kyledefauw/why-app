class ChangePriorityColumnInReasons2 < ActiveRecord::Migration
  def change
    change_column(:reasons, :priority, :string)
  end
end
