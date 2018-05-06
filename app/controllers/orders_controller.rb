class OrdersController < ApplicationController

  def create
    (byebug)
    @order = Order.new(params_order)
    @order.date_order = Time.now
    if @order.save
      create_order_items
      session.delete :order_items
      redirect_to root_url
      flash[:success] = "Buy success!"
    else
       flash[:danger] = "Bạn chưa điền đày đủ thông tin hoặc bạn chưa có sản
       phẩm trong rỏ hàng"
      redirect_to carts_path
    end
  end

  private
  def params_order
    params.require(:order).permit :address, :date_delivery, :total, :user_id
  end
  def create_order_items
    session[:order_items].each do |key, val|
      id_product = key.to_i
      unit_price = Product.find_by(id: id_product).price
      quantily = val.to_i
      order_id = @order.id
      product_id = id_product
      @detail_order = OrderItem.create(unit_price: unit_price,
        quantity: quantily, order_id: order_id, product_id: product_id)
    end
  end
end
