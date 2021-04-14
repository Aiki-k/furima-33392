FactoryBot.define do
  factory :item do
    name { '商品名です。商品名です。' }
    how_item { '商品の説明です。商品の説明です。' }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    delivery_area_id { 2 }
    send_day_id { 2 }
    fee { 1000 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end