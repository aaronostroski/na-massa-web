require 'rails_helper'

RSpec.describe AddProductToCart do
  let(:product) { FactoryBot.create(:product, :active) }

  describe 'Happy path' do
    it 'Should create the order and add item to cart' do
      expect(Order.count).to eql(0)

      service = described_class.new(product_id: product.id)

      expect(service).to be_valid
      expect(service.save).to be true

      expect(service.order).to be_present
      expect(service.order.products).to include(product)
      expect(service.sgid).to be_present

      new_order = GlobalID::Locator.locate_signed(service.sgid)
      expect(new_order).to eql(service.order)
    end

    it 'If there is a existing order, should add to the exiting order and not create a new one' do
      existing_order = FactoryBot.create(:order)
      sgid = existing_order.to_sgid.to_s

      expect(existing_order.products.count).to eql(0)

      service = described_class.new(sgid:, product_id: product.id)

      expect(service).to be_valid
      expect(service.save).to be true

      expect(existing_order.products.count).to eql(1)
      expect(service.order).to eql(existing_order)
      expect(service.order.products).to include(product)
      expect(service.sgid).to eql(sgid)
    end

    it 'Can add multiple products' do
      existing_order = FactoryBot.create(:order, :with_products)
      sgid = existing_order.to_sgid.to_s

      expect(existing_order.products.count).to eql(2)

      service = described_class.new(sgid:, product_id: product.id)

      expect(service).to be_valid
      expect(service.save).to be true

      expect(existing_order.products.count).to eql(2)
      expect(service.order).to eql(existing_order)
      expect(service.order.products).to include(product)
      expect(service.sgid).to eql(sgid)
    end
  end

  describe 'Validations' do
    it 'Product should exist' do
      expect(Product.count).to eql(0)
      fake_id = 1

      service = described_class.new(product_id: fake_id)

      expect(service).to_not be_valid
      expect(
        service.errors.full_messages,
      ).to include 'Este produto não existe no nosso sistema!'
    end

    it 'Product should be actives to be add on cart' do
      not_active_product = FactoryBot.create(:product)
      expect(not_active_product.is_active).to be false

      service = described_class.new(product_id: not_active_product.id)

      expect(service).to_not be_valid
      expect(
        service.errors.full_messages,
      ).to include 'Este produto não existe no nosso sistema!'
    end
  end
end
