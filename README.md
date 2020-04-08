# README
```
git clone https://github.com/ymkthr/freemarket_sample_72f.git
```

## DB設計
### Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|string|null: false|

<!-- |value|integer||
|age|integer|null: false|
|profile_text|text||
|profile_image|string||
|name|string|index: true, null: false| -->

#### Association
- has_many :items, through: :users_items
- has_many :users_items
- has_many :likes
- has_many :comments
- has_one  :address

### Address
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|shipping_first_name|string|null: false|
|shipping_last_name|string|null: false|
|shipping_first_name_kana|string|null: false|
|shipping_last_name_kana|string|null: false|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null :false|
|street|string|null: false|
|room|string||
|phone_number|string||
#### Association
- belongs_to :user

### Users_Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|integer|foreign_key:true|
|seller_id|integer|null:false, foreign_key:true|
|item_id|integer|null:false, foreign_key:true|
#### Association
belongs_to  :user
belongs_to  :item

### Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|details|string|null: false|
|sales_status|integer|null:false|
|item_status|integer|null: false|
|brand|string||
|category_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|shipping_how_to|integer||
|shipping_area|integer|null: false|
|shipping_cost|integer|null: false|
|shipping_bays|string|null: false|
#### Association
- has_many   :users, through: :users_items
- has_many   :users_items
- has_many   :item_images
- belongs_to :category

### Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|integer|null: false, foreign_key:true|
#### Association
- belongs_to :item

### Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
#### Association
- has_many :items

### Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false|
#### Association
belongs_to :user
belongs_to :item


### Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
#### Association
- belongs_to :user
- belongs_to :item