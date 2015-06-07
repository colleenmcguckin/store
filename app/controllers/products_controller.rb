class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort] 
      @products = Product.order(params[:sort])
    end
  end

  def show
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)
  end

  def new
  end

  def create
    
    @product = Product.create(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    redirect_to "/products/#{@product.id}"
    flash[:success] = "Product Added!"


  end

  def edit
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)
  end

  def update
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)
    @product.update(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    flash[:info] = "Product Updated!"
    redirect_to "/products/#{@product_id}"
  end

  def destroy
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)
    @product.destroy
    redirect_to "/products/"
    flash[:warning] = "Product Deleted!"
  end



end
