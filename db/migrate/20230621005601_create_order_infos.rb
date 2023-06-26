class CreateOrderInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :order_infos do |t|
      t.references :order, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :cpf
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
