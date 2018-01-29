class CreateInquieries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquieries do |t|
      t.integer :plz
      t.string :email
      t.string :vorname
      t.string :nachname
      t.string :adresse
      t.string :stadt
      t.string :nachricht
      
      t.timestamps
    end
  end
end
