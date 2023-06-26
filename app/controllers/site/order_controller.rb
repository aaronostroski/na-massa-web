class Site::OrderController < SiteController
  def finish
    @order_info = OrderInfo.new
    @address = Address.new
  end
end
