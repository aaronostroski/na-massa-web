class AddPaymentMethodToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :payment_method, :integer, null: true
    add_index :orders, :payment_method
  end
end
