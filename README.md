# README
```
git clone https://github.com/ymkthr/freemarket_sample_72f.git
```

## DB設計
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|age|integer|null: false|
|nickname|string|null: false, unique: true|
|address|string|null: false|
|value|integer||
|profile-text|text||
|profile-image|string||
#### Association
- has_many :items, through: :users_items
- has_many :users_items
- has_many :items, through: :likes
- has_many :likes
- has_many :items, through: :comments
- has_many :comments

### users_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|integer||
|seller_id|integer|null:false|
|item_id|integer|null:false|
#### Association
belongs_to: user
belongs_to: item

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item-name|string|null: false|
|details|string|null: false|
|item-image_id|integer|null: false|
|sales-status|integer|null:false|
|item-status|integer|null: false|
|brand|string||
|category_id|integer|null: false|
|comment_id|integer||
|like_id|integer||
|price|integer|null: false|
|shipping_how_to|integer||
|shipping_area|integer|null: false|
|shipping_cost|integer|null: false|
|shipping_bays|string|null: false|
#### Association
- has_many :users, through: :users_items
- has_many :users_items
- belongs_to :item-image

### item-imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_1|string|null: false|
|image_2|string||
|image_3|string||
|image_4|string||
|image_5|string||
|image_6|string||
|image_7|string||
|image_8|string||
|image_9|string||
|image_10|string||
#### Association
- belongs_to :item


### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
|text|text|null: false|
#### Association
belongs_to :user
belongs_to :item


### likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
#### Association
- belongs_to :user
- belongs_to :item 