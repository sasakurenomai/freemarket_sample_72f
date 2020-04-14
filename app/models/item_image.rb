class ItemImage < ApplicationRecord
  mount_uploader :image_url , ImageUploader
  
  # validates :image_url, presence: true
  # validates :item_id,   presence: true

  belongs_to :item
end
