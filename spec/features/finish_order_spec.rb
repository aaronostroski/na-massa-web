require 'rails_helper'

RSpec.describe 'FinishOrder', type: :feature do
  describe '#navbar' do
    before { visit(site_finish_order_path) }

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
      expect(page).to have_css('#personal_data .hidden.up')
      expect(page).to_not have_css('#personal_data .hidden.down')
      expect(page).to have_css('#personal_data .collapsible.max-h-full')

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
end
