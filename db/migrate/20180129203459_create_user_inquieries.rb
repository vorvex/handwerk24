class CreateUserInquieries < ActiveRecord::Migration[5.1]
  def change
    create_table :user_inquieries do |t|
      t.integer :user_id
      t.integer :inquiery_id
    end
  end
end
