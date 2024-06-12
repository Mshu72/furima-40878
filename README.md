# テーブル設計

## usersテーブル

| colum              | Type     | Option      |
| ------             | -------- | ----------- | 
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| first_name_kana    | string   | null: false |
| last_name_kana     | string   | null: false |
| nickname           | string   | null: false |
| birthday           | date     | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| colum                 | Type        | Option      |
| ------                | --------    | ----------- | 
| title                 | string      | null: false |
| detail                | text        | null: false |  
| price                 | integer     | null: false |
| user                  | references  | null: false, foreign_key: true |
| prefecture_id         | integer     | null: false |
| quantity_id           | integer     | null: false |
| category_id           | integer     | null: false |
| shipping_fee_id       | integer     | null: false |
| delivery_scheduled_id | integer     | null: false | 

### Association

has_one :order
belongs_to :user
has_one :prefecture
has_one :quantity
has_one :category
has_one :shipping_fee
has_one :delivery_scheduled

## ordersテーブル

| colum              | Type        | Option      |
| ------             | --------    | ----------- | 
| item               | references  | null: false, foreign_key: true |
| user               | references  | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :receiver

## receiversテーブル

| colum              | Type        | Option      |
| ------             | --------    | ----------- |
| postal_code        | string      | null: false |
| prefecture_id      | integer     | null: false |
| city               | string      | null: false |
| address            | string      | null: false |
| building           | string      | 
| phone_number       | string      | null: false |
| order              | references  | null: false, foreign_key: true |

### Association

belongs_to :order
has_one :prefecture