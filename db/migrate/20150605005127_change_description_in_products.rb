class ChangeDescriptionInProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :description, :text
      t.change :price, :decimal, precision: 8, scale:2
      
      add_column :products, :in_stock, :boolean
    end
  end

end
