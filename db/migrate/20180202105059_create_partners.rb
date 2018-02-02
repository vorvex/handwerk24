class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.integer :company_a_id, null: false
      t.integer :company_b_id, null: false
      t.boolean :enabled_by_a
      t.boolean :enabled_by_b
      
      t.timestamps
    
    end
  end
end
