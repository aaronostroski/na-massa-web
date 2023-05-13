require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:admin)).to be_valid
  end
end
