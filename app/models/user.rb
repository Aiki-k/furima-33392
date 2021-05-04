class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ンー－]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ンー－]+\z/ }
    validates :dates
  end

  has_many :items
  has_many :buy_items
end
