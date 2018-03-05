class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.integer :job_id
      t.integer :boat_id
      t.integer :containers
      t.timestamps
    end
  end
end
