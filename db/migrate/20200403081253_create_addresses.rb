class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,                     foreign_key: true
      t.string :shipping_first_name,          null: false
      t.string :shipping_last_name,           null: false
      t.string :shipping_first_name_kana,     null: false
      t.string :shipping_last_name_kana,      null: false
      t.integer :zipcode,                     null: false
      t.string :prefecture,                   null: false
      t.string :city,                         null: false
      t.string :street,                       null: false
      t.string :room
      t.string :phone_number
      t.timestamps
    end
  end
end
