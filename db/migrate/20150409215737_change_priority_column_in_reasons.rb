class ChangePriorityColumnInReasons < ActiveRecord::Migration
  def change
    change_column(:reasons, :priority, :text)
  end
end
