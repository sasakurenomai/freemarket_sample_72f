class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :name, presence: true
  validates :details, presence: true
  validates :price, presence: true
  validates :item_images, presence: true
end
