class RemoveSalesStatusFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :sales_status_id, :integer
  end
end
