class SearchsController < ApplicationController
  def index

    @products = Product.search(params[:search][:object]).page(params[:page]).per Settings.page
  end
end

