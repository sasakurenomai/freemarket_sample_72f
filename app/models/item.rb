class Item < ApplicationRecord
  has_many   :item_images, dependent: :destroy
  has_many   :comments
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :item_images, allow_destroy: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :charge


  validates :name,        presence: true
  validates :details,     presence: true
  validates :price,       presence: true
  validates :item_images, presence: true
  validates :user_id,     presence: true
  validates :item_status_id, presence: true
  validates :shipping_area_id, presence:true
  validates :shipping_days_id, presence: true

end
