class Admin::BannersController < AdminController
  before_action :set_banner, only: [:edit, :update, :destroy]
  before_action :set_status, only: [:index]

  def index
    @filters = parse_filters

    banners = Banner.order(id: :desc)
    banners = banners.search_for(@filters.q) if @filters.q.present?
    banners = banners.where(is_active: @filters.status) if @filters.status.present?

    @banners = banners.page(current_page).per(20)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(form_params)

    if @banner.save
      flash[:success] = I18n.t('.views.defaults.sucessfully_created')
      redirect_to admin_banners_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @banner.update(form_params.to_h)
      flash[:success] = I18n.t('.views.defaults.sucessfully_updated')
      redirect_to admin_banners_path
    else
      render :edit,  status: :unprocessable_entity
    end
  end

  def destroy
    @banner.destroy
    flash[:success] = I18n.t('.views.defaults.sucessfully_deleted')
    redirect_to admin_banners_path
  end

  private

  def parse_filters
    OpenStruct.new(params[:filters])
  end

  def form_params
    params.require(:banner).permit([
      :title,
      :cover_image,
      :is_active,
      :order
    ])
  end

  def set_banner
    @banner = Banner.find(params[:id])
  end

  def set_status
    @status = I18n.t('admin.banners.status').map(&:reverse)
  end
end