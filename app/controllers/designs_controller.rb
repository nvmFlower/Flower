class DesignsController < ApplicationController
  def show
    @designs = Design.find_by id: params[:id]
    @products = Product.where design_id: @designs.id
  end

  private
  def design_params
    params.require(:desgin).permit(:name)
  end
end
