FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    delivery_area_id { 2 }
    j_sityoson { '大阪市' }
    j_banti { '北区3丁目' }
    building { 'Aマンション１１１' }
    phone_number { "08012345678" }
  end
end
# { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }