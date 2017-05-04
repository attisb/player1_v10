class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :display_name
      t.integer :country_id
      t.integer :state_id
      t.integer :established
      t.text :description
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :website

      t.timestamps null: false
    end
  end
end
