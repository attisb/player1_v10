class CreateBeerGroups < ActiveRecord::Migration
  def change
    create_table :beer_groups do |t|
      t.string :name
      t.text :description
      t.integer :order
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
