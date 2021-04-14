class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :how_item
    validates :fee, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 299, less_than: 10_000_000 }
    with_options numericality: { other_than: 1 } do
      validates :status_id
      validates :category_id
      validates :delivery_fee_id
      validates :delivery_area_id
      validates :send_day_id
    end
  end
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :send_day
end
