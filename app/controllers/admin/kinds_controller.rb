class Admin::KindsController < Admin::ApplicationController
  before_action :read_kind, except: %i(new create index)

  def index
    @kinds = Kind.list_all_name.sort_alpha.page(params[:page])
      .per Settings.page
  end

  def new
    @kind = Kind.new
  end

  def create
    @kind = Kind.new kind_params
    if @kind.save
      flash[:success] = t "admin.categories.success"
      redirect_to admin_kinds_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @kind.update_attributes kind_params
      flash[:success] = t "admin.categories.success"
      redirect_to admin_kinds_url
    else
      render :edit
    end
  end

  def destroy
    if @kind
     flash[:success] = t "admin.categories.delete_succes"
    else
      flash[:danger] = t "admin.categories.delete_found"
    end
    redirect_to admin_kinds_path
  end

  private

  def read_kind
    @kind = Kind.find_by id: params[:id]
    if @kind.nil?
      flash[:danger] = t "not_found"
      redirect_to admin_kinds_url
    end
  end

  def kind_params
    params.require(:kind).permit :name
  end
end
