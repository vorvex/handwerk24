class AddColumnToPartnerRequest < ActiveRecord::Migration[5.1]
  def change_table
    add_column :partner_requests, :created_at, :datetime, null: false
    add_column :partner_requests, :updated_at, :datetime, null: false
  end
end
