# テーブル設計

## usersテーブル

| colum              | Type     | Option      |
| ------             | -------- | ----------- | 
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| name               | string   | null: false |
| kana-name          | string   | null: false |
| nickname           | string   | null: false |
| birthday           | text     | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| colum              | Type        | Option      |
| ------             | --------    | ----------- | 
| title              | string      | null: false |
| detail             | text        | null: false |  
| price              | string      | null: false |
| quantity           | string      | null: false |
| category           | string      | null: false |
| shipping-fee       | string      | null: false |
| delivery-scheduled | string      | null: false |
| user               | references  | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## oderテーブル

| colum              | Type        | Option      |
| ------             | --------    | ----------- | 
| payment            | string      | null: false |
| items              | references  | null: false, foreign_key: true |
| user               | references  | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :receiver

## receiverテーブル

| colum              | Type        | Option      |
| ------             | --------    | ----------- |
| receiver-name      | string      | null: false |
| postal-code        | string      | null: false |
| prefecture         | string      | null: false |
| city               | string      | null: false |
| address            | string      | null: false |
| building           | string      | null: false |
| phone-number       | string      | null: false |
| postal-code        | string      | null: false |
| order              | references  | null: false, foreign_key: true |

### Association

belongs_to :order