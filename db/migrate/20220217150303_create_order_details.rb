class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :tax_price
      t.integer :amount
      t.integer :product_status

      t.timestamps
    end
  end
end
