class Site::OrderController < SiteController
  def finish
    @order_info = OrderInfo.new
    @address = Address.new
    @step = params[:step]&.to_i
  end

  def update_payment
    if current_order.update(payment_method: form_params.pop)
      flash[:success] = I18n.t('views.defaults.sucessfully_saved')
      redirect_to site_finish_order_path(step: 3)
    else
      flash[:error] = current_order.errors.full_messages.join(', ')
      redirect_to site_finish_order_path(step: 3)
    end
  end

  private

  def form_params
    params.require(:order).require([:payment_method])
  end
end
