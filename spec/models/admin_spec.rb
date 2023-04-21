require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'Factory build should be valid'
    expect(Factory.build(:admin)).to be_valid
  end
end
