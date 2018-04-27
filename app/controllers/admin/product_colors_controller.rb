class Admin::ProductColorsController < Admin::ApplicationController
  before_action :read_color

  def new
    @pr_color = ProductType.new
  end

  def create
    @pr_color = ProductType.new color_params
    if @pr_color.save
      flash[:success] = t "admin.categories.success"
    else
      flash.now[:danger]= "Loi"
    end
  end

  def edit; end

  def update
    if @pr_color.update_attributes pr_color_params
      flash[:success] = t "admin.categories.success"
  end

  private

  def read_pr_color
    @pr_color = ProductType.find_by id: params[:id]
    return @pr_color unless @pr_color.nil?
      flash[:danger] = t "not_found"
  end

  def pr_color_params
    params.require(:producttype).permit :product_id, :color_id
  end
end
