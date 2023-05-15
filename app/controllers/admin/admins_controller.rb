class Admin::AdminsController < AdminController
  before_action :set_admin, only: %i[edit update destroy]

  def index
    @filters = parse_filters

    admins = Admin.order(id: :desc)
    admins = admins.search_for(@filters.q) if @filters.q.present?

    @admins = admins.page(current_page).per(20)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(form_params)

    if @admin.save
      flash[:success] = I18n.t(".views.defaults.sucessfully_created")
      redirect_to admin_admins_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    params = form_params.to_h
    params = params.except!(:password, :password_confirmation) if params[
      :password
    ].blank?

    if @admin.update(params)
      flash[:success] = I18n.t(".views.defaults.sucessfully_updated")
      redirect_to admin_admins_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin.destroy
    flash[:success] = I18n.t(".views.defaults.sucessfully_deleted")
    redirect_to admin_admins_path
  end

  private

  def parse_filters
    OpenStruct.new(params[:filters])
  end

  def form_params
    params.require(:admin).permit(
      %i[name email is_active password password_confirmation avatar_image],
    )
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
