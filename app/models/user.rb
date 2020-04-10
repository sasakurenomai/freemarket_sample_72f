class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cards

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: "７文字以上の半角英数字で入力してください。"
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday ,presence: true

  has_one :address
  has_many :items, dependent: :destroy
end