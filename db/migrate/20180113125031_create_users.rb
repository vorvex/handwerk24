class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :inhaber
      t.string :email
      t.string :url
      t.integer :plz
      t.string :stadt
      t.string :adresse
      t.string :telefon

      t.timestamps
    end
  end
end
