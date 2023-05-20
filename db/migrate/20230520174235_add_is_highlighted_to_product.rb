class AddIsHighlightedToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :is_highlight, :boolean, default: false
  end
end
