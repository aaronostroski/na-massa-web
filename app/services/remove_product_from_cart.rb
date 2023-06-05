class RemoveProductFromCart
  include ActiveModel::Model

  attr_accessor :sgid, :order, :product, :product_id

  validates :order, :order_products, :product_id, presence: true
  validate :product_should_exist, :should_have_at_least_one_product_to_remove

  def save
    return false unless valid?

    OrderProduct.transaction { order_products&.first&.destroy }

    return false if errors.full_messages.any?

    true
  end

  def create_sgid!
    @sgid = order.to_sgid.to_s
  end

  def order
    @order ||= GlobalID::Locator.locate_signed(sgid)
  end

  def order_products
    @order_products ||= order.order_products.where(product:)
  end

  def product
    @product ||= Product.find_by(id: product_id)
  end

  private

  def total_products_by_choosed
    order.order_products.where(product:).count
  end

  def product_should_exist
    errors.add(:base, :product_doesnt_exist) unless product.present?
  end

  def should_have_at_least_one_product_to_remove
    errors.add(:base, :no_products_to_remove) unless order_products.count > 0
  end
end
