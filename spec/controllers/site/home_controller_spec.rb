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
  end
end
