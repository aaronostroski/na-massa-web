require 'rails_helper'

RSpec.describe Site::HomeController, type: :controller do
  describe 'GET #index' do
    it 'Returns a success response' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'Assigns @banners' do
      banner1_active = FactoryBot.create(:banner, :active, order: 1)
      banner2_active = FactoryBot.create(:banner, :active, order: 2)
      banner3_not_active = FactoryBot.create(:banner, order: 3)

      get :index
      expect(assigns(:banners)).to_not include(banner3_not_active)
      expect(assigns(:banners)).to match_array([banner1_active, banner2_active])
    end

    it 'Assigns @categories' do
      category1_active = FactoryBot.create(:category, :active, order: 1)
      category2_active = FactoryBot.create(:category, :active, order: 2)
      category3_not_active = FactoryBot.create(:category, order: 3)

      get :index
      expect(assigns(:categories)).to_not include(category3_not_active)
      expect(assigns(:categories)).to match_array(
        [category1_active, category2_active],
      )
    end

    it 'Assigns @highlighted_products' do
      product_active_and_highlighted =
        FactoryBot.create(:product, :active, :highlighted)
      product_active = FactoryBot.create(:product, :active)
      product_not_active = FactoryBot.create(:product, :highlighted)

      get :index
      expect(assigns(:highlighted_products)).to include(
        product_active_and_highlighted,
      )
      expect(assigns(:highlighted_products)).to_not match_array(
        [product_active, product_not_active],
      )
    end

    it 'Assigns helper method current_order and sgid' do
      order = FactoryBot.create(:order, :with_products)
      session[:sgid] = order.to_sgid.to_s

      current_order = controller.send(:current_order)
      sgid = controller.send(:sgid)

      expect(current_order).to eq(current_order)
      expect(sgid).to eql(session[:sgid])
    end
  end
end
