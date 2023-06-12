require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'Status' do
    order_pending = FactoryBot.create(:order)
    order_accepted = FactoryBot.create(:order, :accepted)
    order_finished = FactoryBot.create(:order, :finished)
    order_delivered = FactoryBot.create(:order, :delivered)
    order_cancelled = FactoryBot.create(:order, :cancelled)

    expect(order_pending).to be_pending
    expect(order_accepted).to be_accepted
    expect(order_finished).to be_finished
    expect(order_delivered).to be_delivered
    expect(order_cancelled).to be_cancelled
  end

  it 'Total products by product' do
    order = FactoryBot.create(:order, :with_products)
    expect(order.products.count).to eql(2)

    total_products_by_product =
      order.total_products_by_product(order.products.first)
    expect(total_products_by_product).to eql(1)
  end
end
