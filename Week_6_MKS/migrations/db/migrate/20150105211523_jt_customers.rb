class JtCustomers < ActiveRecord::Migration
  def change
    create_table :jtcustomers do |t|
        t.string :first_name
        t.string :last_name
        t.string :email 
  end
  add_index :jtcustomers, :email, :unique => true
 end
end
