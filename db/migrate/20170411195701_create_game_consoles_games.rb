class CreateGameConsolesGames < ActiveRecord::Migration
  def change
    create_table :game_consoles_games do |t|
      t.integer :game_id
      t.integer :game_console_id

      t.timestamps null: false
    end
  end
end
