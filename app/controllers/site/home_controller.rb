class Site::HomeController < SiteController
  def index
    @banners = Banner.active.order(order: :asc)
    @categories = Category.active.order(order: :asc)
  end
end
