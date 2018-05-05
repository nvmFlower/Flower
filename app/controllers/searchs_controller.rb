class SearchsController < ApplicationController
  def index
    @products = Product.name_like(params[:search][:object]).page(params[:page]).per Settings.page
  end
end

