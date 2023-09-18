class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.text :zip_code, null: false
      t.text :shipping_address, null: false
      t.string :shipping_name, null: false

      t.timestamps
    end
  end
end
