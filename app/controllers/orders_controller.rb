class OrdersController < ApplicationController

  def create
    
    price = Product.find_by(id: params[:product_id]).price
    q = params[:quantity].to_i

    if user_signed_in?
      order = Order.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id])
      order.subtotal = order.calculate_subtotal(price)
      order.tax = order.calculate_tax(price)
      order.subtotal = order.calculate_subtotal(price)
      order.total_price = order.calculate_total(price)

      order.save
    else
      redirect_to "/users/sign_in"
    end    
    redirect_to "/orders/#{order.id}"
  end

  def show
    @orders = Order.find_by(id: params[:id])
    # redirect_to "/orders"
  end

end
