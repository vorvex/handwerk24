class CreateSupport < ActiveRecord::Migration[5.1]
  def change
    create_table :supports do |t|
      t.string :title
      t.string :category
      t.string :body
      t.integer :user_id
      
      t.timestamps
    end
  end
end
