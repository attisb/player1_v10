class CreatePlaylistOrders < ActiveRecord::Migration
  def change
    create_table :playlist_orders do |t|
      t.integer :asset_id
      t.integer :playlist_id
      t.integer :order

      t.timestamps null: false
    end
  end
end
