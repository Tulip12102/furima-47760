# テーブル設計

## users テーブル

| Column             | Type     | Options                       |
| ------------------ | -------- | ----------------------------- |
| family_name        | string   | null: false                   |
| first_name         | string   | null: false                   |
| family_name_kana   | string   | null: false                   |
| first_name_kana    | string   | null: false                   |
| email              | string   | null: false, unique: true     |
| encrypted_password | string   | null: false                   |
| nickname           | string   | null: false                   |
| birthday           | date     | null: false                   |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| name                | string       | null: false                    |
| description         | text         | null: false                    |
| price               | integer      | null: false                    |
| user                | references   | null: false, foreign_key: true |
| category_id         | integer      | null: false                    |
| condition_id        | integer      | null: false                    |
| shipping_fee_id     | integer      | null: false                    |
| prefecture_id       | integer      | null: false                    |
| delivery_day_id     | integer      | null: false                    |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address_line   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |


### Association

- belongs_to :order