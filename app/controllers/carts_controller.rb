class CartsController < ApplicationController
  def index
    @products_cart = product_in_carts
    @order_cart = session[:order_items]
    @time = session[:time]
    @subtotal = subtotal
    @order = Order.new
  end

  def update
    id = params[:item][:id_product]
    session[:order_items][id] = params[:item][:quantily].to_i
  end

  def create
    @id_product = params[:session][:product_id]
    if !@id_product.nil?
      add_carts @id_product
      respond_to do |format|
        format.html
        format.js {flash[:success] = "Add success!"}
      end
    else
      flash[:danger] = "error"
    end
  end

  def destroy
    if !params[:id].nil?
      destroy_carts params[:id]
    else
      flash[:danger] = "Delete fail!"
    end
  end

end
