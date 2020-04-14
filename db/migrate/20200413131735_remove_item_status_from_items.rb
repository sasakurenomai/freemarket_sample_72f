class RemoveItemStatusFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :item_status_id, :integer
  end
end
