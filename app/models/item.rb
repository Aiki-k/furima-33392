class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :how_item
    validates :status_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :send_day_id, numericality: { other_than: 1 }
    validates :fee, format: { with: /\A[0-9]+\z/ }
    validates :user_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :send_day
  
end
