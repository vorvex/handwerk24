class CreateServiceSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :service_subjects do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
