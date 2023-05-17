require "rails_helper"

RSpec.describe Category, type: :model do
  it "Factory build should be valid" do
    expect(FactoryBot.build(:category)).to be_valid
  end
end
