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
|name|string|NOT NULL|
|how_item|text|NOT NULL|
|status_id|integer|NOT NULL|
|category_id|integer|NOT NULL|
|delivery_fee_id|integer|NOT NULL|
|delivery_area_id|integer|NOT NULL|
|send_day_id|integer|NOT NULL|
|fee|string|NOT NULL|
|user|references|foreign_key: true|

###　アソシエーション

- belongs_to :users
- has_one :buy


## buys テーブル

|Column|Type|options|
|---|---|---|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### アソシエーション

- belongs_to :users
- belongs_to :items
- has_one :living


## livings テーブル

|Column|Type|options|
|---|---|---|
|postal_code|string|NOT NULL|
|j_todofuken|string|NOT NULL|
|j_sityoson|string|NOT NULL|
|j_banti|string|NOT NULL|
|building|string|NOT NULL|
|phone_number|string|NOT NULL|

### アソシエーション

- belongs_to :buys
