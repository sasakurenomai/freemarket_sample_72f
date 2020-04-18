class ItemImage < ApplicationRecord

  #validates :image_url, presence: true
  #validates :item_id,   presence: true

  mount_uploader :image_url , ImageUploader

  belongs_to :item

  validates :image_url, presence: true
end
