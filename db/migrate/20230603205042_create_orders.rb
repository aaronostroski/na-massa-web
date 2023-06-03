class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 12, scale: 2, default: '0.0'
      t.references :user, null: true, foreign_key: true
      t.string :sgid, null: true
      t.datetime :requested_at, null: true
      t.datetime :accepted_at, null: true
      t.datetime :finished_at, null: true
      t.datetime :develired_at, null: true
      t.datetime :cancelled_at, null: true

      t.timestamps
    end

    add_index :orders, :sgid, unique: true
  end
end
