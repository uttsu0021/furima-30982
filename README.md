# テーブル設計

## Users テーブル

| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| password           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_katakana | string | null: false              |
| first_name_katakana| string | null: false              |
| birthday_year      | integer| null: false              |
| birthday_month     | integer| null: false              |
| birthday_day       | integer| null: false              |

### Association
 - has_many :items
 - has_many :buys

## Items テーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| image            | string     | null: false                    |
| product          | string     | null: false                    |
| explanation      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_name    | string     | null: false                    |
| days_to_ship     | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association
 - belongs_to :user
 - has_one :buy
 - has_one :address

## Buys テーブル

|Column| Type       | Options     |
|------|------------|-------------|
| user | references | null: false |
| item | references | null: false |

### Association
 - belongs_to :user
 - belongs_to :item

## Addresses テーブル

| Column       | Type    | Options     |
|--------------|---------|-------------|
| postal_code  | integer | null: false |
| prefectures  | string  | null: false |
| municipality | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone        | integer | null: false |

### Association
 - belongs_to :item