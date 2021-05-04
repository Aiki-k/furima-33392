class Living < ApplicationRecord
  belongs_to :buy_item

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :delivery_area
end
