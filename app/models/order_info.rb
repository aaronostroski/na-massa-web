class OrderInfo < ApplicationRecord
  belongs_to :order

  validates :order,
            :first_name,
            :last_name,
            :email,
            :cpf,
            :phone,
            presence: true
  validates :phone, :cpf, format: { with: /\A\d{11}\z/ }
  validates :email,
            format: {
              with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
            }
  validates :order, uniqueness: true, allow_nil: true

  before_validation do
    self.phone = strip_mask(self.phone)
    self.cpf = strip_mask(self.cpf)
  end

  private

  def strip_mask(value)
    value&.gsub(/[^0-9]/, '')
  end
end
