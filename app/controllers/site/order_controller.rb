class Site::OrderController < SiteController
  def finish
    @order_info = OrderInfo.new
  end
end
