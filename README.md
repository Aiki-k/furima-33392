#　テーブル設計

## Usersテーブル

|Column|Type|options|
|---|---|---|
|nickname|string|null: false|
|email|string|null: false,unique:true|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|j_seinen|date|null: false|

### アソシエーション

- has_many :items
- has_many :buys


## Items テーブル

|Column|Type|options|
|---|---|---|
|name|string|null: false|
|how_item|text|null: false|
|category_id|string|null: false|
|delivery_fee_id|string|null: false|
|delivery_area_id|string|null: false|
|send_day_id|string|null: false|
|fee|string|null: false|
|user|references|foreign_key:true|

###　アソシエーション

- belongs_to :user
- has_one :buy


## buys テーブル

|Column|Type|options|
|---|---|---|
|user|references|foreign_key:true|
|item|references|foreign_key:true|

### アソシエーション

- belongs_to :user
- belongs_to :item
- has_one :living


## livings テーブル

|Column|Type|options|
|---|---|---|
|postal_code|string|null: false|
|j_todofuken|integer|null: false|
|j_sityoson|integer|null: false|
|j_banti|integer|null: false|
|building|string|
|phone_number|string|null: false|
|buy|references|foreign_key:true|

### アソシエーション

- belongs_to :buy