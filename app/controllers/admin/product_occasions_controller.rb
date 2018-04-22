class Admin::ProductOccasionsController < Admin::ApplicationController
  before_action :read_color

  def new
    @pr_occasion = ProductOccasion.new
  end

  def create
    @pr_occasion = ProductOccasion.new color_params
    if @pr_occasion.save
      flash[:success] = t "admin.categories.success"
    else
      flash.now[:danger]= "Loi"
    end
  end

  def edit; end

  def update
    if @pr_occasion.update_attributes pr_occasion_params
      flash[:success] = t "admin.categories.success"
    end
  end

  private

  def read_pr_occasion
    @pr_occasion = ProductOccasion.find_by id: params[:id]
    return @pr_occasion unless @pr_occasion.nil?
      flash[:danger] = t "not_found"
  end

  def pr_occasion_params
    params.require(:producttype).permit :product_id, :color_id
  end
end
