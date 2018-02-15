class AddColumnToServiceSubcategories < ActiveRecord::Migration[5.1]
  def change
    add_reference :service_subcategories, :service_category, foreign_key: true
  end
end
