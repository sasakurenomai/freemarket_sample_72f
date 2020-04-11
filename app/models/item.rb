class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :category
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days


  validates :name, presence: true
  validates :details, presence: true
  validates :price, presence: true
  validates :item_images, presence: true
end
