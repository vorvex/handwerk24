class AddServicesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :services, foreign_key: true
  end
end
