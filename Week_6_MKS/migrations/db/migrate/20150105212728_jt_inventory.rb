class JtInventory < ActiveRecord::Migration
  def change
    create_table :products do |t|
        t.string :description
        t.float :price
        t.integer :seller_id
        t.string :product_name
        t.integer :num_available
    end
  end
end
