class KindsController < ApplicationController
  def show
    @types = Kind.find_by id: params[:id]
    @products = @types.products.page(params[:page]).per(Settings.page)
  end

  def kind_params
    params.require(:kind).permit(:name)
  end
end
