require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:order_product)).to be_valid
  end

  it 'Cant be possible to have two entities with same values' do
    order_product = FactoryBot.create(:order_product)
    expect(
      FactoryBot.build(
        :order_product,
        order: order_product.order,
        product: order_product.product,
      ),
    ).to_not be_valid
  end
end
