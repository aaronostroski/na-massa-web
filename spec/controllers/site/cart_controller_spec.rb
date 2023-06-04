require 'rails_helper'

RSpec.describe Site::CartController, type: :controller do
  describe 'POST #add_product' do
    let(:product) { FactoryBot.create(:product, :active) }

    it 'Add successfuly to cart' do
      expect(session[:sgid]).to be_nil
      post :add_product, params: { id: product.id }
      expect(flash[:success]).to eql(
        I18n.t('.site.cart.flashs.successful_add_to_cart'),
      )
      expect(response).to have_http_status(:success)
      expect(session[:sgid]).to be_present
    end

    it 'Returns error if has a error to insert cart' do
      product.update(is_active: false)

      post :add_product, params: { id: product.id }
      expect(flash[:error]).to include(
        I18n.t(
          '.activemodel.errors.models.add_product_to_cart.attributes.base.product_doesnt_exist',
        ),
      )
      expect(response).to have_http_status(:bad_request)
      expect(session[:sgid]).to be_nil
    end
  end
end
