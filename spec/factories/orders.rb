FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    delivery_area_id { 2 }
    j_sityoson { '大阪市' }
    j_banti { '北区3丁目' }
    building { 'Aマンション１１１' }
    phone_number { "08012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
