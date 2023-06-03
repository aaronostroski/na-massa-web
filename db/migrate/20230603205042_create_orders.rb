class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 12, scale: 2, default: '0.0'
      t.datetime :requested_at, null: true
      t.datetime :accepted_at, null: true
      t.datetime :finished_at, null: true
      t.datetime :delivered_at, null: true
      t.datetime :cancelled_at, null: true

      t.timestamps
    end
  end
end
