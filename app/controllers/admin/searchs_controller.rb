class Admin::SearchsController < Admin::ApplicationController
  def index
     @products = Product.where(["name LIKE ?", "%#{params[:search]}%"]).page(params[:page]).per Settings.page
  end
end
