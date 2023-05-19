require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:product)).to be_valid
  end
end
