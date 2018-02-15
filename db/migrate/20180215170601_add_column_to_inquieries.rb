class AddColumnToInquieries < ActiveRecord::Migration[5.1]
  def change
    add_column :inquieries, :title, :string
    add_column :inquieries, :period, :string
  end
end
