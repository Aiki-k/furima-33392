#　テーブル設計

## Usersテーブル

|Column|Type|options|NOT NULL|
|---|---|---|
|nickname|string|NOT NULL|
|email|string|NOT NULL,unique:true|
|encrypted_password|string|NOT NULL|
|last_name|string|NOT NULL|
|first_name|string|NOT NULL|
|last_name_kana|string|NOT NULL|
|first_name_kana|string|NOT NULL|
|j_seinen|date|NOT NULL|

### アソシエーション

- has_many :items
- has_many :buys


## Items テーブル

|Column|Type|options|
|---|---|---|
|name|string|NOT NULL|
|how_item|text|NOT NULL|
|category_id|string|NOT NULL|
|delivery_fee_id|string|NOT NULL|
|delivery_area_id|string|NOT NULL|
|send_day_id|string|NOT NULL|
|fee_id|string|NOT NULL|
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