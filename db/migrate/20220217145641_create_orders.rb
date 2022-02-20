class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :billing
      t.integer :payment
      t.integer :order_status

      t.timestamps
    end
  end
end
