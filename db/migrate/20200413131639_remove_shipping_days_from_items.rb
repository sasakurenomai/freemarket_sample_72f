class RemoveShippingDaysFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_days_id, :integer
  end
end
