class Admin::OccasionsController < Admin::ApplicationController
  before_action :read_occasion, except: %i(new create index)

  def index
    @occasions = Occasion.list_all_name.sort_alpha.page(params[:page])
      .per Settings.page
  end

  def new; end

  def create
    @occasion = Occasion.new occasion_params
    if @occasion.save
      flash[:success] = t "admin.categories.success"
      redirect_to admin_occasions_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @occasion.update_attributes occasion_params
      flash[:success] = t "admin.categories.success"
      redirect_to admin_occasions_url
    else
      render :edit
    end
  end

  def destroy
    if @occasion.destroy
     flash[:success] = t "admin.categories.delete_succes"
    else
      flash[:danger] = t "admin.categories.delete_found"
    end
    redirect_to admin_occasions_path
  end

  private

  def read_occasion
    @occasion = Occasion.find_by id: params[:id]
    return @occasion unless @occasion.nil?
      flash[:danger] = t "not_found"
      redirect_to admin_occasions_path
  end

  def occasion_params
    params.require(:occasion).permit :name
  end
end
