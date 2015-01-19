class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :name
        t.integer :bike_id
    end
  end
end

