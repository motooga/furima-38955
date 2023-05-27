# README

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| family_name         | string | null: false |
| name                | string | null: false |
| furigana_family_name| string | null: false |
| furigana_name       | string | null: false |

has_many :items
has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| shipping_charges   | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| shipping_days      | string     | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

has_one :order
belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| price   | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| street           | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| order_id         | integer    | null: false, foreign_key: true |

belongs_to :order