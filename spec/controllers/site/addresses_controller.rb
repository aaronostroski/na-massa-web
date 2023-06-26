require 'rails_helper'

RSpec.describe Site::AddressesController, type: :controller do
  describe 'POST #create' do
    before do
      order = FactoryBot.create(:order, :with_products)
      session[:sgid] = order.to_sgid.to_s
      expect(session[:sgid]).to be_present
    end

    it 'Crate address with success' do
      post :create,
           params: {
             address: {
               'zipcode' => '88111550',
               'number' => 595,
               'complement' => 'teste',
               'neighborhood' => 'teste',
               'street' => 'teste',
               'city' => 'teste',
               'reference' => 'teste',
             },
           }

      expect(flash[:success]).to eql(I18n.t('views.defaults.sucessfully_saved'))
      expect(response).to have_http_status(:redirect)
    end

    it 'Returns error if has a error to create address' do
      post :create,
           params: {
             address: {
               'zipcode' => '8812211550',
               'number' => 595,
               'complement' => 'teste',
               'neighborhood' => 'teste',
               'street' => 'teste',
               'city' => 'teste',
               'reference' => 'teste',
             },
           }
      expect(flash[:error]).to include 'CEP não é válido'
      expect(response).to have_http_status(:redirect)
    end
  end
end
