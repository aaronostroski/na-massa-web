require 'rails_helper'

RSpec.describe Site::OrderInfosController, type: :controller do
  describe 'POST #create' do
    before do
      order = FactoryBot.create(:order, :with_products)
      session[:sgid] = order.to_sgid.to_s
      expect(session[:sgid]).to be_present
    end

    it 'Crate order info with success' do
      post :create,
           params: {
             order_info: {
               first_name: 'test',
               last_name: 'test',
               email: 'test@test.com',
               cpf: '11122233344',
               phone: '22111114444',
             },
           }

      expect(flash[:success]).to eql(I18n.t('views.defaults.sucessfully_saved'))
      expect(response).to have_http_status(:redirect)
    end

    it 'Returns error if has a error to create order info' do
      post :create,
           params: {
             order_info: {
               first_name: 'test',
               last_name: 'test',
               email: 'test',
               cpf: '11122233344',
               phone: '22111114444',
             },
           }
      expect(flash[:error]).to include 'Email não é válido'
      expect(response).to have_http_status(:redirect)
    end
  end
end
