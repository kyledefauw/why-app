class AddUserIdColumnToLifeVentures < ActiveRecord::Migration
  def change
    add_column :life_ventures, :user_id, :integer
  end
end
