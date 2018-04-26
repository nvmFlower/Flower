class TypesController < ApplicationController
  def show
    @types = TypeFlower.find_by id: params[:id]
    @products = TypeFlower.find_by(id: params[:id]).type_product
  end

  def type_params
    params.require(:type).permit(:name)
  end
end
