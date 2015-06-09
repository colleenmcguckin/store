class ProductsController < ApplicationController
  def index
    if params[:sort] 
      if params[:by] == "low"
        @products = Product.order(params[:sort]) # params[:sort] == "price"
      elsif params[:by] == "high"
        @products = Product.order(params[:sort] => :desc)
      elsif params[:by] == "discount"
        @products = Product.where("price < ?", 2).order(params[:sort])
      end
    elsif params[:random] == "true"
      product = Product.order("RAND()").first
      redirect_to "/products/#{product.id}"
    else
      @products = Product.all
    end

  end

  def show
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)
    if params[:id] == "random"
      product = Product.order("RAND()").first
      redirect_to "/products/#{product.id}"
    end

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

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render :index
  end

end
