class AddFieldsToDrink < ActiveRecord::Migration
  def change
    add_column :drinks, :country_id, :integer
    add_column :drinks, :state_id, :integer
    add_column :drinks, :description, :text
    add_column :drinks, :short_description, :string
    add_column :drinks, :color, :integer
    add_column :drinks, :coming_soon, :boolean
  end
end
