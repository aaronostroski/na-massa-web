class AddAddressToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :address, index: true, null: true
  end
end
