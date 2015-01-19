class JtOrders < ActiveRecord::Migration
  def change
    create_table :jtorders do |t|
        t.integer :customer_id
        t.date :date
        t.float :total_cost

        t.timestamps
  end
 end
end
