class ProductsController < ApplicationController
def index
@products = Product.all
end
def show
  @product = Product.find(params[:id])
end
def new
  @product = Product.new
end
def create 
  @product = Product.new  
   @product.save
    # redirect_to @products
end
def update 
@product.update
end
def destroy
@product.destroy 
end

end
