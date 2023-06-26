class Site::AddressesController < SiteController
  before_action :set_address

  def create
    @address.assign_attributes(form_params.to_h)

    if @address.save
      current_order.update(address: @address) if current_order.address.nil?
      flash[:success] = I18n.t('views.defaults.sucessfully_saved')
      redirect_to site_finish_order_path(step: 3)
    else
      flash[:error] = @address.errors.full_messages.join(', ')
      redirect_to site_finish_order_path(step: 2)
    end
  end

  private

  def set_address
    @address ||= current_order&.address || Address.new
  end

  def form_params
    params.require(:address).permit(
      %i[number complement zipcode city street neighborhood reference],
    )
  end
end
