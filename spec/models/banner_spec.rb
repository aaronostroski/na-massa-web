require 'rails_helper'

RSpec.describe Banner, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:banner)).to be_valid
  end

  it 'Cant create banner with same order' do
    expect(FactoryBot.create(:banner, order: 1)).to be_valid
    expect(FactoryBot.build(:banner, order: 1)).to_not be_valid
  end
end
