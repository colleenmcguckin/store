class ChangeDescriptionInProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :description, :text
      t.change :price, :string
      
      add_column :products, :in_stock, :boolean
    end
  end

end
