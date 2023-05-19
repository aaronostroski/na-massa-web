require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  describe '#navbar' do
    before { visit(site_home_path) }

    it 'Should find logo' do
      expect(find('nav')).to have_css('img[alt="Na massa"]')
    end

    it 'Must find session buttons' do
      find_link('Entrar').visible?
      find_link('Cadastrar').visible?
    end
  end

  describe '#banners' do
    it 'Must have banners if are active' do
      banner1 = FactoryBot.create(:banner, :active, title: 'Img 1')
      banner2 = FactoryBot.create(:banner, :active, title: 'Img 2')

      visit(site_home_path)

      expect(page).to have_css('.glide__slide', count: 2, wait: 5)
      expect(page).to have_css("img[alt='#{banner1.title}']")
      expect(page).to have_css("img[alt='#{banner2.title}']")

      find("[data-glide-dir='<']").click

      expect(page).to have_css("img[alt='#{banner2.title}']")

      find("[data-glide-dir='>']").click

      expect(page).to have_css("img[alt='#{banner1.title}']")
    end

    it 'Section cant has banners if thet are desactive' do
      FactoryBot.create(:banner, title: 'Img 1')

      visit(site_home_path)

      expect(page).to have_css('.glide__slide', count: 0, wait: 5)
    end

    it 'if there is only one banner, the arrows must be hidden' do
      FactoryBot.create(:banner, :active, title: 'Img 1')

      visit(site_home_path)

      expect(page).to have_css('.glide__slide', count: 1, wait: 5)
      expect(page).to_not have_selector("[data-glide-dir='<']", visible: :all)
      expect(page).to_not have_selector("[data-glide-dir='>']", visible: :all)
    end
  end

  describe '#categories' do
    it 'Must have categories if are active' do
      category1 = FactoryBot.create(:category, :active, name: 'Ctg 1')
      category2 = FactoryBot.create(:category, :active, name: 'Ctg 2')

      visit(site_home_path)

      expect(page).to have_css("img[alt='#{category1.name}']")
      expect(page).to have_css("img[alt='#{category2.name}']")
    end

    it 'Section cant has categories if thet are desactive' do
      FactoryBot.create(:category, name: 'Ctg 1')

      visit(site_home_path)

      expect(page).to have_css('#categories > img', count: 0, wait: 5)
    end
  end
end
