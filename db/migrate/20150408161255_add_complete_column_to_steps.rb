class AddCompleteColumnToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :complete, :boolean
  end
end
