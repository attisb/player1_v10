class AddTapListToBeerSize < ActiveRecord::Migration
  def change
    add_column :beer_sizes, :use_tap_lis, :boolean
  end
end
