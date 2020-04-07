class CreateUsersItems < ActiveRecord::Migration[5.2]
  def change
    create_table :users_items do |t|
      t.integer :buyer_id,              foreign_key:true
      t.integer :seller_id, null:false, foreign_key:true
      t.integer :item_id,   null:false, foreign_key:true

      t.timestamps
    end
  end
end
