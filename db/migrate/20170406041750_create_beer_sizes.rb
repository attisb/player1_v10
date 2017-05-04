class CreateBeerSizes < ActiveRecord::Migration
  def change
    create_table :beer_sizes do |t|
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
