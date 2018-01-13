class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :adresse
      t.integer :plz
      t.string :stadt
      t.string :telefon
      t.timestamp
    end
  end
end
