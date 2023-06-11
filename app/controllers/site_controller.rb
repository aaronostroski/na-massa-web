class SiteController < ApplicationController
  layout 'site'

  helper_method :current_order

  def current_order
    @current_order ||= GlobalID::Locator.locate_signed(sgid) if sgid
  end

  def sgid
    session[:sgid]
  end
end
