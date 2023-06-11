class Site::CartController < SiteController
  def add_product
    service = AddProductToCart.new(sgid:, product_id: params[:id])

    if service.save
      session[:sgid] = service.sgid if sgid.nil?
      flash[:success] = I18n.t('.site.cart.flashs.successful_add_to_cart')
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream:
                   turbo_stream.update(
                     "product_#{service.product.id}",
                     partial: 'site/cart/total_products',
                     locals: {
                       product: service.product,
                     },
                   )
        end
      end
    else
      head(:bad_request)
      flash[:error] = service.errors.full_messages.join(',')
    end
  end

  def remove_product
    service = RemoveProductFromCart.new(sgid:, product_id: params[:id])

    if service.save
      flash[:success] = I18n.t('.site.cart.flashs.successful_remove_from_cart')
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream:
                   turbo_stream.update(
                     "product_#{service.product.id}",
                     partial: 'site/cart/total_products',
                     locals: {
                       product: service.product,
                     },
                   )
        end
      end
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
