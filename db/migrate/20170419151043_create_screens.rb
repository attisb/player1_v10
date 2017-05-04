class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :name
      t.string :direction
      t.string :location
      t.string :screen_type
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
