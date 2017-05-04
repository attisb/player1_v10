class AddCodeToScreen < ActiveRecord::Migration
  def change
    add_column :screens, :codeword, :string
  end
end
