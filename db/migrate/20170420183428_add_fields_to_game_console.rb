class AddFieldsToGameConsole < ActiveRecord::Migration
  def change
    add_column :game_consoles, :tier, :integer
    add_column :game_consoles, :visible, :boolean
  end
end
