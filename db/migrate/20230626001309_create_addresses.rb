class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zipcode, null: false
      t.integer :number, null: false
      t.string :complement, null: false
      t.string :neighborhood, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :reference, null: true

      t.timestamps
    end
  end
end
