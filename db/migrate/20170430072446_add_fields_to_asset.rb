class AddFieldsToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :menu_type, :string
  end
end
