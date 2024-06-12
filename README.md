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

| colum              | Type        | Option      |
| ------             | --------    | ----------- | 
| title              | string      | null: false |
| detail             | text        | null: false |  
| price              | integer     | null: false |
| user               | references  | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

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
| receiver_name      | string      | null: false |
| postal_code        | string      | null: false |
| city               | string      | null: false |
| address            | string      | null: false |
| building           | string      | 
| phone_number       | string      | null: false |
| order              | references  | null: false, foreign_key: true |

### Association

belongs_to :order