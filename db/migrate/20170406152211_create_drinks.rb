class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :abv
      t.integer :ibu
      t.boolean :visible
      t.integer :beer_group_id
      t.integer :beer_style_id
      t.integer :brewery_id

      t.timestamps null: false
    end
  end
end
