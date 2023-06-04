require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:order_product)).to be_valid
  end
end
