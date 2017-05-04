class CreateUserWants < ActiveRecord::Migration
  def change
    create_table :user_wants do |t|
      t.integer :user_id
      t.integer :drink_id

      t.timestamps null: false
    end
  end
end
