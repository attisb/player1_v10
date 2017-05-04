class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :drink_id
      t.text :message

      t.timestamps null: false
    end
  end
end
