class AddColumnToBoat < ActiveRecord::Migration[5.1]
  def change
    add_column :boats, :loadtaken, :integer
  end
end
