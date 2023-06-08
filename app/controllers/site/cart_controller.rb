class Site::CartController < SiteController
  def add_product
    service = AddProductToCart.new(sgid:, product_id: params[:id])

    if service.save
      session[:sgid] = service.sgid if sgid.nil?
      flash[:success] = I18n.t('.site.cart.flashs.successful_add_to_cart')
      head(:ok)
    else
      flash[:error] = service.errors.full_messages.join(',')
      head(:bad_request)
    end
  end

  def remove_product
    service = AddProductToCart.new(sgid:, product_id: params[:id])

    if service.save
      flash[:success] = I18n.t('.site.cart.flashs.successful_remove_from_cart')
      head(:ok)
    else
      flash[:error] = service.errors.full_messages.join(',')
      head(:bad_request)
    end
  end

  private

  def sgid
    @sgid = session[:sgid]
  end
end
