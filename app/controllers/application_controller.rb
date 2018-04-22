class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionHelper

  before_action :set_locale, :logged_in_user
  before_action :read_menu

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def read_menu
    @occasions = Occasion.all
    @kind = Kind.all
    @design = Design.all
    @order_item = current_order.order_items.new
    @search = Product.ransack params[:q]
  end

  def current_cart
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
    end
  end
end
