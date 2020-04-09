class Item < ApplicationRecord
    # "validates :カラム名, presence: true" を適用するカラム
    columns = %w[
        :name
        :details
        :user_id
        :sales_status
        :item_status
        :price
        :shipping_area
        :shipping_cost
        :shipping_days
    ]

    columns.each do |column|
        validates column, presence: true
    end

    belongs_to :user
    has_many :item_images, dependent: :destroy
    # belongs_to :category
end
