class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      ##t.string  :name,            null: false
      ##t.string  :details,         null: false
      ##t.references :user,         null: false, foreign_key:true
      ##t.integer :buyer_id
      ##t.integer :sales_status,    null: false
      ##t.integer :item_status,     null: false

      t.string  :name,               null: false
      t.string  :details,            null: false
      t.integer :price,              null: false
      t.bigint  :buyer_id
      t.bigint  :user_id,            null: false, foreign_key:true

      t.string  :brand
      t.bigint  :category_id
      t.integer :charge_id
      t.integer :shipping_area_id,   null: false
      t.integer :shipping_days_id,   null: false
      t.integer :item_status_id,     null: false
      t.timestamps
    end
  end
end
