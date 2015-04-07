class CreateObstacles < ActiveRecord::Migration
  def change
    create_table :obstacles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
