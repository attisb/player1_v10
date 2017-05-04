class AddFieldsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :make_public, :boolean
    add_column :notes, :approved, :boolean
  end
end
