class CartsController < ApplicationController
  def index
    @user = ""
  end

  private
    def cart_params
      params.require(:cart).params
    end
end
