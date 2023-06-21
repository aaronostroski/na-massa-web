require "rails_helper"

RSpec.describe OrderInfo, type: :model do
  it "Factory build should be valid" do
    expect(FactoryBot.build(:order_info)).to be_valid
  end

  it "Should be invalid build with wrong phone" do
    order_info = FactoryBot.build(:order_info, phone: "123213")
    expect(order_info).to_not be_valid
    expect(order_info.errors.full_messages).to include 'Telefone não é válido'
  end

  it "Should be invalid build with invalid cpf" do
    order_info = FactoryBot.build(:order_info, cpf: "123213")
    expect(order_info).to_not be_valid
    expect(order_info.errors.full_messages).to include 'CPF não é válido'
  end

  it "Should be invalid build with wrong email" do
    order_info = FactoryBot.build(:order_info, email: "test@teste")
    expect(order_info).to_not be_valid
    expect(order_info.errors.full_messages).to include 'Email não é válido'
    end
end
