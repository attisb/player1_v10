class AddMenuToScreen < ActiveRecord::Migration
  def change
    add_column :screens, :show_menu, :boolean
  end
end
