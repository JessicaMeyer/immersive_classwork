class CreateEarthlings < ActiveRecord::Migration
  def change
    create_table :earthlings do |t|
        t.string :name
        t.references :abduction

        t.timestamps
    end
  end
end
