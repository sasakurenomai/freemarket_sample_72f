class Address < ApplicationRecord
  belongs_to :user, optional: true
  # validates :shipping_first_name, :shipping_last_name, :shipping_first_name_kana, :shipping_last_name_kana,
  # :zipcode, :prefecture, :city, :street ,presence: true
  
end

