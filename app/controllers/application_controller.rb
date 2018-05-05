class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionHelper
  include CartsHelper

  before_action :set_locale, :logged_in_user
  before_action :read_menu
  before_action :create_session

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def read_menu
    @occasions = Occasion.all
    @type_flower = TypeFlower.all
    @design = Design.all
    @search = Product.ransack params[:q]
  end
  def method_name

  end
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
    end
  end
  def create_session
    session[:order_items] ||= Hash.new
    session[:time] ||= Hash.new
  end
end
