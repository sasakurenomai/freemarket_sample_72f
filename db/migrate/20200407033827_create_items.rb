class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,               null: false
      t.string  :details,            null: false
      t.integer :price,              null: false
      t.bigint  :buyer_id
      t.bigint  :user_id,            null: false, foreign_key:true
      t.bigint  :cetegory_id
      t.string  :brand
      t.integer :charge_id
      t.integer :shipping_area_id,   null: false
      t.string  :shipping_days_id,   null: false
      t.integer :sales_status,       null: false
      t.integer :item_status,        null: false

      t.timestamps
    end
  end
end
