class AddShippingAreaToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_area_id, :integer, null:false
  end
end
