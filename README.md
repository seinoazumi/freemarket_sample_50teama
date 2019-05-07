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
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone|integer||
|birthday|integer||
|money|integer|null: false, default :0|
|point|integer|null: false, default :0|
|card|integer||
|seller_id|integer|null: false|
|buyer_id|integer|null: false|
|profile|text|limit: 1000|
### Association
- has_many :likes
- has_many :items, through: :likes
- belongs_to :card

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|
### Assosiation
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 40|
|condition|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
|seller_id|reference|null: false, foreign_key: true|
|buyer_id|reference|foreign_key: true|

### Association
- has_many :likes
- has_many :users, through: :likes
- has_many :images
- has_many :categories

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|null: false, foreign_key: true|
|image|string|null :false|
### Association
- belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|ancestry|string||

### Association
- has_many :items
- has_ancestry
