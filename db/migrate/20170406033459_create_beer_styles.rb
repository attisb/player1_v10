class CreateBeerStyles < ActiveRecord::Migration
  def change
    create_table :beer_styles do |t|
      t.string :name
      t.text :description
      t.integer :abv_range_start
      t.integer :abv_range_end
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
