class PagesController < ApplicationController
  def index
    @products = Product.limit(6).order view: :desc
  end
  def show
    @products = search.result
  end
end
