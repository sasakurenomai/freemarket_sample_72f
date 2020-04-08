class ItemImage < ApplicationRecord
  validates :image_url, presence: true
  validates :item_id,   presence: true

  belongs_to :item
end
