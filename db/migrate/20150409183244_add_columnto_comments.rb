class AddColumntoComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :obstacle_id, :integer
  end
end
