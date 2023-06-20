class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :order, :product, presence: true

  after_commit(on: %i[create destroy]) do
    broadcast_action_to(
      'total_products',
      action: :update,
      target: nil,
      targets: ".product_#{product.id}",
      partial: 'site/cart/total_products',
      locals: {
        product: product,
        current_order: order,
      },
    )

    broadcast_action_to(
      'cart',
      action: :replace,
      target: 'cart',
      partial: 'layouts/site/products',
      locals: {
        current_order: order,
      },
    )
  end
end
