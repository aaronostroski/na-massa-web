class Site::OrderInfosController < SiteController
  def create
    if current_order.update(order_info_attributes: form_params.to_h)
      flash[:success] = I18n.t('views.defaults.sucessfully_saved')
      redirect_to site_finish_order_path(step: 2)
    else
      flash[:error] = @order_info.errors.full_messages.join(', ')
      redirect_to site_finish_order_path(step: 1)
    end
  end

  private

  def form_params
    params.require(:order_info).permit(%i[first_name last_name email phone cpf])
  end
end
