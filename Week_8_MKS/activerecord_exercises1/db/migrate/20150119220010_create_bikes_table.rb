class CreateBikesTable < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
        t.references :user
        t.string :color
    end
  end
end
