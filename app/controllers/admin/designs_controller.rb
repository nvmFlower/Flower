class Admin::DesignsController < Admin::ApplicationController
  before_action :read_design, except: %i(new create index)

  def index
    @designs = Design.list_all_name.sort_alpha.page(params[:page]).per Settings.page
  end

  def new; end

  def create
    @design = Design.new design_params
    if @design.save
      flash[:success] = t "admin.categories.success"
      redirect_to admin_designs_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @design.update_attributes design_params
      flash[:success] = t "admin.categories.success"
      redirect_to admin_designs_url
    else
      render :edit
    end
  end

  def destroy
    if @design.destroy
      flash[:success] = t "admin.categories.delete_succes"
    else
      flash[:danger] = t "admin.categories.delete_found"
    end
    redirect_to admin_designs_path
  end

  private

  def read_design
    @design = Design.find_by id: params[:id]
    return @design unless @design.nil?
      flash[:danger] = t "not_found"
      redirect_to admin_designs_path
  end

  def design_params
    params.require(:design).permit :name
  end
end
