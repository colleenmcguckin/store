class Product < ActiveRecord::Base

  belongs_to :supplier #must be singular!!! SUPPLIER!!!!
  has_many :images
  has_many :orders
  has_many :categorized_products
  

  SALES_TAX = 0.09

  def sale_message
    if price.to_f < 2
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def pay_tax
    tax = ((price.to_f)*SALES_TAX).round(2)
    "Tax on this item: $#{tax}"
  end

  def total_cost
    tax = ((price.to_f)*SALES_TAX).round(2)
    total = tax.to_f + price.to_f.round(2)
    "Total cost of this item: $#{total}"
  end

end

