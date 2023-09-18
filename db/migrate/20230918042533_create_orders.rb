class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :postage, null: false
      t.integer :billing_amount, null: false
      t.integer :status, null: false, default: 0
      t.text :zip_code, null: false
      t.text :shipping_address, null: false
      t.string :shipping_name, null: false

      t.timestamps
    end
  end
end
