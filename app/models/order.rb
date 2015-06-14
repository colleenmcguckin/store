class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user 

  SALES_TAX = 0.09
  def calculate_subtotal(price)
    quantity * price
  end

  def calculate_tax(price)
    quantity * price * SALES_TAX
  end

  def calculate_total(price) 
    quantity * price * (1+SALES_TAX)
  end

  def total_cost
    tax = ((price.to_f)*SALES_TAX).round(2)
    total = tax.to_f + price.to_f.round(2)
    "Total cost of this item: $#{total}"
  end

end
