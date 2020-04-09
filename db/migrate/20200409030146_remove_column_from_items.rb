class RemoveColumnFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_how_to_id, :integer
    remove_column :items, :shipping_area_id, :integer
    remove_column :items, :item_status_id, :integer
    remove_column :items, :shipping_days_id, :integer
  end
end
