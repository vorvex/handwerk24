class CreateUserServices < ActiveRecord::Migration[5.1]
  def change
    create_table :user_services do |t|
      t.integer :user_id
      t.integer :service_id
    end
  end
end
