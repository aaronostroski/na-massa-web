class Site::OrderController < SiteController
  def finish
    @order_info = OrderInfo.new
    @address = Address.new
    @step = params[:step]&.to_i || 1
  end
end
