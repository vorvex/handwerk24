class DropUserServices < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_services
  end
end
