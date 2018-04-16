class PagesController < ApplicationController
  def index
    @products = Product.limit(6).order view: :desc
  end
end
