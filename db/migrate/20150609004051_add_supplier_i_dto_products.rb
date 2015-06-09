class AddSupplierIDtoProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      
      add_column :products, :supplier_id, :integer
    end
  end
end
