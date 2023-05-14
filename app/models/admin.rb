class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scoped_search on: [:name, :email]

  has_one_attached :avatar_image

  validates :email, :name, :is_active, presence: true
end
