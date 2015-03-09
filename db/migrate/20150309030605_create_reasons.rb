class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.string :name
      t.integer :priority
      t.integer :life_venture_id
    end
  end
end
