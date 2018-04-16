class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    @color = @product.color_products
    @comment = Comment.where product_id: params[:id]
  end

end
