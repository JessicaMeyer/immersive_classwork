class CreateUsers < ActiveRecord::Migration
  def change
     create_table :users do |t|
        t.string :name
        t.string :hair_color
        t.integer :age
    end
  end
end
