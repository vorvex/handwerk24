class CreateServiceInquieries < ActiveRecord::Migration[5.1]
  def change
    create_table :service_inquieries do |t|
      t.integer :service_id
      t.integer :inquiery_id
    end
  end
end
