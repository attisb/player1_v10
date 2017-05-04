class AddFieldsToGames < ActiveRecord::Migration
  def change
    add_column :games, :players, :integer
    add_column :games, :release_date, :date
  end
end
