class AddFirstNameLastNameSocialSec < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :ssn, :integer
    add_index :users, :ssn, :unique => true
  end
end
