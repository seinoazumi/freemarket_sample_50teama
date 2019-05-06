# README
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 20|
|email|string|null: false, unique: true|
|password|string|null: false|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postal_code|integer|null: false|
|perfecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone|integer||
|birthday|integer||
|seller_id|integer|null: false|
|buyer_id|integer|null: false|
|profile|integer|limit: 1000|
### Association
- has_many :trades
- has_many :products, through: :trades
- has_many :likes
- has_many :products, through: :trades

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 40|
|condition|integer|null: false|
|delivery_fee|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
### Association
- has_many :trade
- has_many :users, through: :trades
- has_many :likes
- has_many :users, through: :likes
- has_many :images
- belongs_to :category

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|products_id|reference|null :false|
|image|string|null :false|
### Association
- belongs_to :product

## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|reference|null :false|
|image|string|null :false|
### Association
- belongs_to :user
- belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null :false|
|product_id|reference|null :false|
### Association
- belongs_to :user
- belongs_to :product


## category1テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
### Association
- has_many :category3

## category2テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|category1_id|reference|null :false|

### Association
- has_many :category3

## category3テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|category1_id|reference|null :false|
|category2_id|reference||

### Association
- belongs_to :category1
- belongs_to :category2
