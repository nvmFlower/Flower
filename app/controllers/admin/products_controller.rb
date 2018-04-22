class Admin::ProductsController < Admin::ApplicationController
  before_action :read_product, except: %i(index new create)
  before_action :list_categories, only: %i(new create edit )
  before_action :check?, only: %i(new)

  def index
    @products = Product.all
  end

  def new
    if check?
      flash[:danger] = "Chua nhap day du categories!"
      redirect_to admin_products_url
    else
      @product = Product.new
      @product_color = @product.product_colors.build
      @product_occasion = @product.product_occasions.build
      @product_type = @product.product_types.build
    end
  end

  def create
    @product = Product.new product_params

    params[:colors][:id].each do |color|
      if !color.empty?
        @product.product_colors.build color_id: color
      end
    end

     params[:type_flowers][:id].each do |type|
      if !type.empty?
        @product.product_types.build type_flower_id: type
      end
    end

     params[:occasions][:id].each do |occasion|
      if !occasion.empty?
        @product.product_occasions.build occasion_id: occasion
      end
    end

    if @product.save
      flash[:success] ="Them Thanh Cog"
      redirect_to admin_products_url
    else
      render :new
    end
  end

  def show
    @product_color = @product.product_colors
    @product_type = @product.product_types
    @product_occasion = @product.product_occasions
  end

  def edit
      @product_color = @product.product_colors.build
      @product_occasion = @product.product_occasions.build
      @product_type = @product.product_types.build
  end


  def update
    if @product.update_attributes product_params

      params[:colors][:id].each do |color|
        if !color.empty?
          @product.product_colors.build color_id: color
        end
      end

      params[:type_flowers][:id].each do |type|
        if !type.empty?
          @product.product_types.build type_flower_id: type
        end
      end

      params[:occasions][:id].each do |occasion|
        if !occasion.empty?
          @product.product_occasions.build occasion_id: occasion
        end
      end

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

  private

    def list_categories
      @list_occasions = Occasion.list_all_name
      @list_colors = Color.list_all_name
      @list_types = TypeFlower.list_all_name
      @list_designs = Design.list_all_name
    end

    def check?
      @list_occasions.empty? || @list_types.empty? || @list_types.empty? || @list_colors.empty?
    end

    def read_product
      @product = Product.find_by(id: params[:id])
    end

    def product_params
      params.require(:product).permit :name, :price, :img, :sale, :details,
        :view, :rating, :design_id
    end

end


