require 'rails_helper'

RSpec.describe CategoryProduct, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:category_product)).to be_valid
  end
end
