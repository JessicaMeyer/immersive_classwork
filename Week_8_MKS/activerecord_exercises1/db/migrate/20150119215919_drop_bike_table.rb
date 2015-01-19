class DropBikeTable < ActiveRecord::Migration
  def change
    drop_table :bike_tables
  end
end
