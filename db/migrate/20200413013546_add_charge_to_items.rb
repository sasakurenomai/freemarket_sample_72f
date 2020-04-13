class AddChargeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :charge_id, :integer, null:false
  end
end
