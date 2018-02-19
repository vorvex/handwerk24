class CreatePersonalizations < ActiveRecord::Migration[5.1]
  def change
    create_table :personalizations do |t|
      t.string :color_primary, default: '007ACE'
      t.string :color_secondary, default: 'FFFFFF'
      t.string :first_entry_a, default: 'phone'
      t.string :main_entry_a, default: 'website'
      t.integer :user_id, null: false
      
      t.timestamps
    end
  end
end
