require 'rails_helper'

RSpec.describe RemoveProductFromCart do
  let(:product1) { FactoryBot.create(:product, :active) }
  let(:product2) { FactoryBot.create(:product, :active) }
  let(:order) { FactoryBot.create(:order, products: [product1, product2]) }
  let(:sgid) { order.to_sgid.to_s }

  describe 'Happy path' do
    before { expect(order.order_products.count).to eql(2) }

    it 'Should remove the product from cart' do
      service = described_class.new(sgid:, product_id: product1.id)

      expect(service).to be_valid
      expect(service.save).to be true

      expect(order.order_products.count).to eql(1)
      expect(service.order.products).to_not include(product1)
      expect(service.order.products).to include(product2)
    end

    it 'Can just one remove one product if there is more than 1' do
      FactoryBot.create(:order_product, product: product1, order:)
      expect(order.order_products.count).to eql(3)

      service = described_class.new(sgid:, product_id: product1.id)

      expect(service).to be_valid
      expect(service.save).to be true

      expect(order.order_products.count).to eql(2)
      expect(order.products).to match_array([product1, product2])
    end
  end

  describe 'Validations' do
    it 'Product should exist' do
      expect(Product.count).to eql(0)
      fake_id = 1

      service = described_class.new(sgid:, product_id: fake_id)

      expect(service).to_not be_valid
      expect(
        service.errors.full_messages,
      ).to include 'Este produto não existe no nosso sistema!'
    end

    it 'Product to have remove should at least has one on the cart' do
      product3 = FactoryBot.create(:product, :active)
      service = described_class.new(sgid:, product_id: product3.id)

      expect(service).to_not be_valid
      expect(
        service.errors.full_messages,
      ).to include 'Não e possivel remover um produto que você não tem no carrinho!'
    end
  end
end
