require 'rails_helper'

RSpec.describe 'FinishOrder', type: :feature do
  before do
    order = FactoryBot.create(:order, :with_products)

    SiteController.any_instance.stub(:current_order).and_return(order)
    visit(site_finish_order_path)
  end

  describe '#navbar' do
    it 'Should find logo' do
      expect(find('nav')).to have_css('img[alt="Na massa"]')
    end

    it 'Must find session buttons' do
      find_link('Entrar').visible?
      find_link('Cadastrar').visible?
    end
  end

  describe '#personal_data' do
    it 'Must have personal data expanded' do
      visit(site_finish_order_path)

      expect(page).to have_css('#personal_data')
      expect(page).to_not have_css('#personal_data .hidden.down')
      expect(page).to have_css('#personal_data .hidden.up')
      expect(page).to_not have_css('#personal_data .collapsible.max-h-full')

      expect(page).to have_selector(
        "#personal_data [name='order_info[first_name]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#personal_data [name='order_info[last_name]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#personal_data [name='order_info[email]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#personal_data [name='order_info[cpf]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#personal_data [name='order_info[phone]']",
        visible: :all,
      )
    end
  end

  describe '#address_data' do
    it 'Must have addess data' do
      visit(site_finish_order_path)

      expect(page).to have_css('#address_data')
      expect(page).to_not have_css('#address_data .hidden.down')
      expect(page).to have_css('#address_data .hidden.up')
      expect(page).to_not have_css('#address_data .collapsible.max-h-full')

      expect(page).to have_selector(
        "#address_data [name='address[complement]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#address_data [name='address[number]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#address_data [name='address[zipcode]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#address_data [name='address[city]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#address_data [name='address[neighborhood]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#address_data [name='address[street]']",
        visible: :all,
      )
      expect(page).to have_selector(
        "#address_data [name='address[reference]']",
        visible: :all,
      )
    end
  end

  describe '#payment_data' do
    it 'Must have payment data' do
      visit(site_finish_order_path)

      expect(page).to have_css('#payment_data')
      expect(page).to_not have_css('#payment_data .hidden.down')
      expect(page).to have_css('#payment_data .hidden.up')
      expect(page).to_not have_css('#payment_data .collapsible.max-h-full')

      expect(page).to have_selector(
        "#payment_data [name='order[payment_method]']",
        visible: :all,
        count: 3,
      )
    end
  end
end
