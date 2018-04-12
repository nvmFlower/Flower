class Admin::ColorsController < Admin::BaseController
  before_action :set_color, except: %i(new create index)

  def index
    @colors = Color.list_categories.sort_alpha
  end

  def show; end

  def new
    @color = Color.new
  end

  def edit; end

  def create
    @color = Color.new color_params
    if @color.save
      redirect_to admin_colors_url
    else
      render :new
    end
  end

  def update
    if @color.update_attributes color_params
      redirect_to admin_colors_url
    else
      render :edit
    end
  end

  def destroy
    @color.destroy
    redirect_to admin_colors_url
  end

  private

  def set_color
    @color = Color.find_by id: params[:id]
  end

  def color_params
    params.require(:color).permit :name
  end
end
