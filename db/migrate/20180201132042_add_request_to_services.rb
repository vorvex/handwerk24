class AddRequestToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :show, :boolean
  end
end
