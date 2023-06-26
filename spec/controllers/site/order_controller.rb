require 'rails_helper'

RSpec.describe Site::OrdersController, type: :controller do
  describe 'PATCH #update_payment' do
    before do
      order = FactoryBot.create(:order, :with_products)
      session[:sgid] = order.to_sgid.to_s
      expect(session[:sgid]).to be_present
    end

    it 'Update payment method with success' do
      patch :update_payment, params: { order: { payment_method: :cash } }

      expect(flash[:success]).to eql(I18n.t('views.defaults.sucessfully_saved'))
      expect(response).to have_http_status(:redirect)
    end
  end
end
