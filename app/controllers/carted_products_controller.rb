class CartedProductsController < ApplicationController
   def create

    if user_signed_in?
      item = CartedProduct.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id], status: "carted")
      item.save
      redirect_to "/products/"
    else
      redirect_to "/users/sign_in"
    end    
   
  end

  def index
    if user_signed_in?
      user = User.find_by(id: current_user)
      @items = user.carted_products.where(status: "carted")
      
    else
      redirect_to "/users/sign_in"
    end
  end

  def destroy
    cart = CartedProduct.find_by(id: params[:id])
    cart.update(status: "removed")
    redirect_to "/products"
  end
end





