#　テーブル設計

## Usersテーブル

|Column|Type|options|NOT NULL|
|---|---|---|
|nickname|string|NOT NULL|
|email|string|unique: true|
|encrypted_password|string|NOT NULL|
|last_name|string|NOT NULL|
|first_name|string|NOT NULL|
|last_name_kana|string|NOT NULL|
|first_name_kana|string|NOT NULL|
|dates|date|NOT NULL|

### アソシエーション

- has_many :items
- has_many :buys


## Items テーブル

|Column|Type|options|
|---|---|---|
|name|string|NOT NULL|
|how_item|text|NOT NULL|
|status_id|integer|NOT NULL|
|category_id|integer|NOT NULL|
|delivery_fee_id|integer|NOT NULL|
|delivery_area_id|integer|NOT NULL|
|send_day_id|integer|NOT NULL|
|fee|integer|NOT NULL|
|user|references|foreign_key: true|

### アソシエーション

- belongs_to :user
- has_one :buy


## buys テーブル

|Column|Type|options|
|---|---|---|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### アソシエーション

- belongs_to :user
- belongs_to :item
- has_one :living


## livings テーブル

|Column|Type|options|
|---|---|---|
|postal_code|string|NOT NULL|
|delivery_area_id|integer|NOT NULL|
|j_sityoson|string|NOT NULL|
|j_banti|string|NOT NULL|
|building|string|
|phone_number|string|NOT NULL|
|buy|references|foreign_key: true|

### アソシエーション

- belongs_to :buy
