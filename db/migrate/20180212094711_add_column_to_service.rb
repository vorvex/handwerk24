class AddColumnToService < ActiveRecord::Migration[5.1]
  def change
    add_reference :services, :service_category, foreign_key: true
    add_reference :services, :service_subcategory, foreign_key: true
    add_reference :services, :service_subject, foreign_key: true
  end
end
