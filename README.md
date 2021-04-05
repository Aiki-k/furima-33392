#　テーブル設計

## Usersテーブル

|Column|Type|options|NOT NULL|
|---|---|---|
|nickname|string|NOT NULL|
|email|string|NOT NULL|
|password|string|NOT NULL|
|last_name|string|NOT NULL|
|first_name|string|NOT NULL|
|last_name_kana|string|NOT NULL|
|first_name_kana|string|NOT NULL|
|year|date|NOT NULL|
|month|date|NOT NULL|
|day|date|NOT NULL|

### アソシエーション

- has_many :items
- has_many :buys


## Items テーブル

|Column|Type|options|
|---|---|---|
|image|text|NOT NULL|
|name|string|NOT NULL|
|how_item|text|NOT NULL|
|category_id|integer|NOT NULL|
|item_status|text|NOT NULL|
|delivery_fee_id|integer|NOT NULL|
|delivery_area_id|integer|NOT NULL|
|send_day_id|integer|NOT NULL|
|fee|integer|NOT NULL|
|user_id|references|

###　アソシエーション

- belongs_to :users
- has_one :buy


## buys テーブル

|Column|Type|options|
|---|---|---|
|user_id|references|
|item_id|references|

### アソシエーション

- belongs_to :users
- belongs_to :items
- has_one :living


## livings テーブル

|Column|Type|options|
|---|---|---|
|postal_code|string|NOT NULL|
|j_sityoson|string|NOT NULL|
|j_banti|string|NOT NULL|
|building|string|NOT NULL|
|phone_number|string|NOT NULL|
|delivery_area_id|

### アソシエーション

- belongs_to :buys