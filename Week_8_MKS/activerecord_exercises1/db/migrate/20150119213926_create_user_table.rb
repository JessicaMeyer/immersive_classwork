class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :user_tables do |t|
        t.string :name
        t.integer :bike_id
    end
  end
end
