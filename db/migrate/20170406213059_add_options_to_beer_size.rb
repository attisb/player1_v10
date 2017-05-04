class AddOptionsToBeerSize < ActiveRecord::Migration
  def change
    add_column :beer_sizes, :is_draft, :boolean
  end
end
