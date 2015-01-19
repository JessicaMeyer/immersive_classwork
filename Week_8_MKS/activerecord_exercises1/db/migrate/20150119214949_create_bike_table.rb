class CreateBikeTable < ActiveRecord::Migration
  def change
    create_table :bike_tables do |t|
        t.references :user
        t.string :color
    end
  end
end
