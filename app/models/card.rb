class Card < ApplicationRecord
  belongs_to :user
  #validates :name, presence: true, format: {with: /\A[0-9]+\z/}
end
