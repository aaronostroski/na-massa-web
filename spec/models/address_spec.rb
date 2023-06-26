require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:address)).to be_valid
  end
end
