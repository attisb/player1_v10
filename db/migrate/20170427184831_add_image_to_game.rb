class AddImageToGame < ActiveRecord::Migration
  def change
    add_column :games, :cover_image, :string
    add_column :games, :hero_image, :string
  end
end
