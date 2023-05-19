class Admin::ProductsController < AdminController
  before_action :set_product, only: %i[edit update destroy]
  before_action :set_active, only: [:index]

  def index
    @filters = parse_filters

    products = Product.order(id: :desc)
    products = products.search_for(@filters.q) if @filters.q.present?
    products =
      products.where(is_active: @filters.active) if @filters.active.present?

    @products = products.page(current_page).per(20)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(form_params)

    if @product.save
      flash[:success] = I18n.t('.views.defaults.sucessfully_created')
      redirect_to admin_products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(form_params.to_h)
      flash[:success] = I18n.t('.views.defaults.sucessfully_updated')
      redirect_to admin_products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    flash[:success] = I18n.t('.views.defaults.sucessfully_deleted')
    redirect_to admin_products_path
  end

  private

  def parse_filters
    OpenStruct.new(params[:filters])
  end

  def form_params
    params.require(:product).permit(
      %i[name description price cover_image is_active],
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_active
    @active = I18n.t('admin.products.active').map(&:reverse)
  end
end
