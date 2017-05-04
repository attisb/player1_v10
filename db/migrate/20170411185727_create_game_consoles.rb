class CreateGameConsoles < ActiveRecord::Migration
  def change
    create_table :game_consoles do |t|
      t.string :name
      t.string :short_code

      t.timestamps null: false
    end
  end
end
