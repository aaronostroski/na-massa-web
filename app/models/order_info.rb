class OrderInfo < ApplicationRecord
  belongs_to :order

  validates :order, :first_name, :last_name, :email, :cpf, :phone, presence: true
  validates :phone, :cpf, format: { with: /\A\d{11}\z/ }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
end
