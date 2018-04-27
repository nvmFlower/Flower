class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    @num = Product.number_view @product.id
    @product.update_attributes(view: (@num+1))
    @product.save
    @product = Product.find_by id: params[:id]
    @color = @product.color_products
    @comments = Comment.where product_id: params[:id]
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :img)
    end
end
