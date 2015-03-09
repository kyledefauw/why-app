class CreateLifeVenture < ActiveRecord::Migration
  def change
    create_table :life_ventures do |t|
      t.string :name
      t.string :category

      t.timestamps null: false
    end
  end
end
