require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Factory build should be valid' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'With user' do
    expect(FactoryBot.build(:order, :with_user)).to be_valid
  end

  it 'With anonymous' do
    expect(FactoryBot.build(:order, :with_anonymous)).to be_valid
  end

  it 'Status' do
    order_pending = FactoryBot.create(:order, :with_anonymous)
    order_accepted = FactoryBot.create(:order, :accepted)
    order_finished = FactoryBot.create(:order, :finished)
    order_develired = FactoryBot.create(:order, :develired)
    order_cancelled = FactoryBot.create(:order, :cancelled)

    expect(order_pending.status).to be_pending
    expect(order_accepted.status).to be_accepted
    expect(order_finished.status).to be_finished
    expect(order_develired.status).to be_develired
    expect(order_cancelled.status).to be_cancelled
  end
end
