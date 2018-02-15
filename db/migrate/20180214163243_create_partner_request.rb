class CreatePartnerRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :partner_requests do |t|
      t.string :name
      t.string :email
      t.integer :user_id
      
      t.timestamps
    end
  end
end
