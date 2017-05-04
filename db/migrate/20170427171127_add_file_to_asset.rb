class AddFileToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :ad_asset_file, :string
  end
end
