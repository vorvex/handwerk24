class RenameColumnInUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :valid, :bulletproof
  end
end
