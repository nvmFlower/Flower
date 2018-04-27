class OccasionsController < ApplicationController

  def show
    @occasion = Occasion.find_by id: params[:id]
    @products = Occasion.find_by(id: params[:id]).oc_products.page(params[:page]).per(Settings.page)

  end

  private
  def occasions_params
    params.require(:occasion).permit(:name)
  end
end
