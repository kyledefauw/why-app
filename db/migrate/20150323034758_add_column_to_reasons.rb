class AddColumnToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :created_at, :datetime
    add_column :reasons, :updated_at, :datetime
  end
end
