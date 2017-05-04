class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :game_console_id

      t.timestamps null: false
    end
  end
end
