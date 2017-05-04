class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :direction
      t.date :date_show
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
