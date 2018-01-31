class DropServiceIdFromUser < ActiveRecord::Migration[5.1]
  def self.down
    remove_column :users, :services_id
  end
end
