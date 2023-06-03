class Site::HomeController < SiteController
  def index
    @banners = Banner.active.order(order: :asc)
    @categories = Category.active.order(order: :asc)
    @highlighted_products = Product.active.highlighted.limit(4)
  end
end
