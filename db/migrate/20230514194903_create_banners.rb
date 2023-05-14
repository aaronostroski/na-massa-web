class CreateBanners < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.string :title, null: false
      t.boolean :is_active, default: false
      t.integer :order, null: false

      t.timestamps
    end
  end
end
