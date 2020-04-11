class RemoveCategoryIdFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :category_id
  end
end
