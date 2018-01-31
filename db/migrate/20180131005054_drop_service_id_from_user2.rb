class DropServiceIdFromUser2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :services_id
  end
end
