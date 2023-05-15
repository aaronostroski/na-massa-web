class Admin::CategoriesController < AdminController
  before_action :set_banner, only: %i[edit update destroy]
  before_action :set_status, only: [:index]

  def index
    @filters = parse_filters

    categories = Category.order(order: :desc)
    categories = categories.search_for(@filters.q) if @filters.q.present?
    categories =
      categories.where(is_active: @filters.status) if @filters.status.present?

    @categories = categories.page(current_page).per(20)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(form_params)

    if @category.save
      flash[:success] = I18n.t(".views.defaults.sucessfully_created")
      redirect_to admin_categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(form_params.to_h)
      flash[:success] = I18n.t(".views.defaults.sucessfully_updated")
      redirect_to admin_categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    flash[:success] = I18n.t(".views.defaults.sucessfully_deleted")
    redirect_to admin_categories_path
  end

  private

  def parse_filters
    OpenStruct.new(params[:filters])
  end

  def form_params
    params.require(:category).permit(%i[name is_active order])
  end

  def set_banner
    @category = Category.find(params[:id])
  end

  def set_status
    @status = I18n.t("admin.categories.status").map(&:reverse)
  end
end
