class Item < ApplicationRecord
    has_many :users, through: :users_items
    has_many :users_items
    has_many :item_images
    # belongs_to :category
end
