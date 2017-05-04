class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :amount
      t.integer :drink_id
      t.integer :beer_size_id
      t.boolean :available
      t.boolean :is_new
      t.boolean :is_coming_soon
      t.boolean :is_returning
      t.boolean :is_special

      t.timestamps null: false
    end
  end
end
