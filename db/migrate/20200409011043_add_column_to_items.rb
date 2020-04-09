class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sales_status_id,  :integer,     null:false
    add_column :items, :item_status_id,   :integer,     null:false
    add_column :items, :shipping_area_id, :integer,     null:false
    add_column :items, :shipping_days_id, :integer,     null: false
  end
end
