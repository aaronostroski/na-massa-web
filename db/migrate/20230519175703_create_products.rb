class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, :decimal, precision: 12, scale: 2, default: '0.0'
      t.boolean :is_active, default: false, null: false

      t.timestamps
    end
  end
end
