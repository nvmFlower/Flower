class Admin::ColorsController < Admin::ApplicationController
  before_action :read_color, except: %i(new create index)

  def index
    @colors = Color.list_all_name.sort_alpha.page(params[:page]).per Settings.page
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new color_params
    if @color.save
      flash[:success] = t "admin.categories.success"
      redirect_to admin_colors_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @color.update_attributes color_params
      flash[:success] = t "admin.categories.success"
      redirect_to admin_colors_url
    else
      render :edit
    end
  end

  def destroy
    if @color.destroy
      flash[:success] = t "admin.categories.delete_succes"
    else
      flash[:danger] = t "admin.categories.delete_found"
    end
    redirect_to admin_colors_path
  end

  private

  def read_color
   @color = Color.find_by id: params[:id]
    return @color unless @color.nil?
      flash[:danger] = t "not_found"
      redirect_to admin_colors_path
  end

  def color_params
    params.require(:color).permit :name
  end
end
