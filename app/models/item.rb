class Item < ApplicationRecord
    # "validates :カラム名, presence: true" を適用するカラム
    # columns = %w[
    #     :name
    #     :details
    #     :user_id
    #     :sales_status
    #     :item_status
    #     :price
    #     :shipping_area
    #     :shipping_cost
    #     :shipping_days
    # ]

    # columns.each do |column|
    #     validates column, presence: true
    # end

    # belongs_to :category
  has_many :item_images, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :name, presence: true
  validates :details, presence: true
  validates :price, presence: true
  validates :item_images, presence: true
end
