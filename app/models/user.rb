class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    #  validates :email, uniqueness: true
    han_eisu = /\A[a-z0-9]+\z/i
    zenkaku = /\A[ぁ-んァ-ン一-龥]/
    zen_kana = /\A[ァ-ヶー－]+\z/
    validates :password, length: { minimum: 6 },format: { with: han_eisu }
    validates :last_name,format: { with: zenkaku }
    validates :first_name,format: { with: zenkaku }
    validates :last_name_kana,format: { with: zen_kana }
    validates :first_name_kana,format: { with: zen_kana }
    validates :dates
  end
end