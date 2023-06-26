class Site::OrderInfosController < SiteController
  before_action :set_order_info

  def create
    @order_info.assign_attributes(form_params.to_h)

    if @order_info.save
      flash[:success] = I18n.t('views.defaults.sucessfully_saved')
      redirect_to site_finish_order_path(step: 2)
    else
      flash[:error] = @order_info.errors.full_messages.join(', ')
      redirect_to site_finish_order_path(step: 1)
    end
  end

  private

  def set_order_info
    @order_info = OrderInfo.find_or_initialize_by(order: current_order)
  end

  def form_params
    params.require(:order_info).permit(%i[first_name last_name email phone cpf])
  end
end
