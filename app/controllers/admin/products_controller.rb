class Admin::ProductsController < Admin::ApplicationController
  before_action :read_product, except: %i(index new create)

  def index
    @products = Product.all
  end

  def new
    if false
      flash[:danger] = "Chua nhap day du categories!"
      redirect_to admin_products_url
    else
      @product = Product.new
    end
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] ="Them Thanh Cog"
      redirect_to admin_products_url
    else
      render :new
    end
  end

  def show; end

  def edit; end


  def update
    if @product.update_attributes product_params
      render :show
    else
      flash[:danger] = "Loi"
      render :edit
    end

  end

  def destroy
    @product.destroy
    flash[:success] ="Xoa Thanh Cong"
    redirect_to admin_products_url
  end

  def delete_multi
    Product.delete_all(params[:product_ids])
  end

  private

    def read_product
      @product = Product.find_by(id: params[:id])
    end

    def product_params
      params.require(:product).permit :name, :price, :img, :sale, :details,
        :view, :rating, :design_id, {color_ids: []}, {kind_ids: []},
        {occasion_ids: []}
    end

end


