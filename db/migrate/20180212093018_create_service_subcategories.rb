class CreateServiceSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :service_subcategories do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
