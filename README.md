# README

## users テーブル

| Column              | Type     | Options                   |
| ------------------- | -------- | ------------------------- |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| nickname            | string   | null: false               |
| family_name         | string   | null: false               |
| name                | string   | null: false               |
| kana_family_name    | string   | null: false               |
| kana_name           | string   | null: false               |
| birthday            | date     | null: false               |

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

- has_one :order
- belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| area_id          | integer    | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

- belongs_to :order