class AddProductToCart
  include ActiveModel::Model
  include ActiveRecord::Callbacks # Include the callbacks module

  attr_accessor :sgid, :order, :product, :product_id

  validates :order, :product, :product_id, presence: true
  validate :product_should_exist

  def save
    return false unless valid?

    Order.transaction do
      order.save! unless order.persisted?
      order.order_products.create!(product:)
    end

    create_sgid! if sgid.nil?

    true
  end

  def create_sgid!
    @sgid = order.to_sgid.to_s
  end

  def order
    @order ||= GlobalID::Locator.locate_signed(sgid) || Order.new
  end

  def product
    @product ||= Product.active.find_by(id: product_id)
  end

  private

  def product_should_exist
    errors.add(:base, :product_doesnt_exist) unless product.present?
  end
end
