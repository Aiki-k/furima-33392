class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :j_sityoson, :j_banti, :building, :phone_number, :user_id, :item_id, :buy_item

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :delivery_area_id
    validates :j_sityoson, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :j_banti
    validates :phone_number, numericality: { only_integer: true }
  end

  def save
    buy_item = BuyItem.create(user_id: user_id, item_id: item_id)
    # binding.pry
    Living.create(postal_code: postal_code, delivery_area_id: delivery_area_id, j_sityoson: j_sityoson, j_banti: j_banti,
                  building: building, phone_number: phone_number, buy_item_id: buy_item.id)
  end
end