class CreateAbductions < ActiveRecord::Migration
  def change
    create_table :abductions do |t|
        t.references :martian, index: true
        t.references :earthling, index: true

        t.timestamps
    end
  end
end
