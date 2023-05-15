class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.boolean :is_active, default: false, null: false
      t.integer :order, null: false

      t.timestamps
    end
  end
end
