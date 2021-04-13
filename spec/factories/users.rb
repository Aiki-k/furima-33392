FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@test' }
    password { 'aaa1111' }
    password_confirmation { password }
    last_name { '鈴木' }
    first_name { '太郎' }
    last_name_kana { 'スズキ' }
    first_name_kana { 'タロウ' }
    dates { '2010-01-01' }
  end
end
