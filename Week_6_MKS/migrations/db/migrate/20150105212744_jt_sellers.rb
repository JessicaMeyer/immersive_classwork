class JtSellers < ActiveRecord::Migration
  def change
    create_table :jtsellers do |t|
        t.string :company_name
    end
  end
end
