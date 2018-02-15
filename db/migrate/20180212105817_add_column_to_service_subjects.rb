class AddColumnToServiceSubjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :service_subjects, :service_subcategory, foreign_key: true
  end
end
