class OrdersController < ApplicationController

  def create
    if user_signed_in?
      cart = CartedProduct.where(status: "carted")
      order = Order.create()
      @subtotal = 0   
      cart.each do |carted_product|
       @subtotal += carted_product.calculate_subtotal(carted_product.product.price)
      end
      @tax = @subtotal*0.09
      @total = @subtotal + @tax
      Order.find_by(id: order.id).update(user_id: current_user.id, subtotal: @subtotal, tax: @tax, total_price: @total)
      cart.update_all(order_id: order.id, status: "confirmed")
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
