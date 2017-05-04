class CreateScreenOrders < ActiveRecord::Migration
  def change
    create_table :screen_orders do |t|
      t.integer :screen_id
      t.integer :playlist_id
      t.integer :order

      t.timestamps null: false
    end
  end
end
