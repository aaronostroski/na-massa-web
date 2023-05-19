class CreateCategoryProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :category_products do |t|
      t.references :category, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.index %i[category_id product_id], unique: true

      t.timestamps
    end
  end
end
