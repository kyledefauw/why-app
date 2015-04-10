class CreateLifeVenturesCategories < ActiveRecord::Migration
  def change
    create_table :life_ventures_categories do |t|
      t.integer :life_venture_id
      t.integer :category_id
    end
  end
end
