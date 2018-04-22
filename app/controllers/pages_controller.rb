class PagesController < ApplicationController
  def index

    @products = Product.limit(6).order view: :desc
    @order_item = current_order.order_items.new
  end
  def show

    @products = search.result
  end
end
