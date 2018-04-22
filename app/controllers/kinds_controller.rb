class KindsController < ApplicationController
  def show
    @types = Kind.find_by id: params[:id]
    @products = Kind.find_by(id: params[:id]).type_product
  end

  def kind_params
    params.require(:kind).permit(:name)
  end
end
