class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :user_id
      t.decimal{8, 2} :total_price
      t.boolean :status
      t.decimal{8, 2} :tax
      t.decimal{8, 2} :subtotal

      t.timestamps null: false
    end
  end
end
