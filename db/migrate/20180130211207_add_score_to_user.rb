class AddScoreToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :score, :float
  end
end
