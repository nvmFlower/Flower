class Admin::TypeFlowersController < Admin::ApplicationController
  before_action :read_type_flower, except: %i(new create index)

  def index
    @type_flowers = TypeFlower.list_all_name.sort_alpha.page(params[:page])
      .per Settings.page
  end

  def new
    @type_flower = TypeFlower.new
  end

  def create
    @type_flower = TypeFlower.new type_flower_params
    if @type_flower.save
      flash[:success] = t "admin.categories.success"
      redirect_to admin_type_flowers_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @type_flower.update_attributes type_flower_params
      flash[:success] = t "admin.categories.success"
      redirect_to admin_type_flowers_url
    else
      render :edit
    end
  end

  def destroy
    if @type_flower
     flash[:success] = t "admin.categories.delete_succes"
    else
      flash[:danger] = t "admin.categories.delete_found"
    end
    redirect_to admin_type_flowers_path
  end

  private

  def read_type_flower
    @type_flower = TypeFlower.find_by id: params[:id]
    if @type_flower.nil?
      flash[:danger] = t "not_found"
      redirect_to admin_type_flowers_url
    end
  end

  def type_flower_params
    params.require(:type_flower).permit :name
  end
end
