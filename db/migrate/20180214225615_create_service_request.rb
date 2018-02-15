class CreateServiceRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :service_requests do |t|
      t.string :name
      t.text :message
      t.integer :user_id
      
      t.timestamps
    end
  end
end
