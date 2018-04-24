class Admin::DesignsController < Admin::ApplicationController
  before_action :read_design, except: %w(index new create)
  def index
    @designs = Design.all
  end

  def new
    @designs = Design.new
  end

  def create
    @designs = Design.new design_params
    if @designs.save
      redirect_to admin_designs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @designs.update_attributes design_params
     redirect_to admin_designs_path
    else
      render :edit
    end
  end

  private

  def design_params
    params.require(:design).permit :name
  end

  def read_design
    @designs = Design.find_by id: params[:id]
  end
end
