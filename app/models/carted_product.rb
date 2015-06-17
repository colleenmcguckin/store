class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :user

 def calculate_subtotal(price)
    quantity * price
  end

end
