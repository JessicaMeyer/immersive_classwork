class DropUserTable < ActiveRecord::Migration
  def change
        drop_table :user_tables
  end
end
