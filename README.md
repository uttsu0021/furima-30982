# テーブル設計

## Users テーブル

| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_katakana | string | null: false              |
| first_name_katakana| string | null: false              |
| birthday           | date   | null: false              |

### Association
 - has_many :items
 - has_many :buys

## Items テーブル

| Column             | Type        | Options                        |
|--------------------|-------------|--------------------------------|
| product            | string      | null: false                    |
| explanation        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| shipping_charge_id | integer     | null: false                    |
| shipping_area_id   | integer     | null: false                    |
| days_to_ship_id    | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :buy

## Buys テーブル

|Column| Type       | Options     |
|------|------------|-------------|
| user | references | null: false |
| item | references | null: false |

### Association
 - belongs_to :user
 - belongs_to :item
 - has_one :address
## Addresses テーブル

| Column            | Type    | Options     |
|-------------------|---------|-------------|
| postal_code       | string  | null: false |
| shipping_area_id  | string  | null: false |
| municipality      | string  | null: false |
| address           | string  | null: false |
| building          | string  |             |
| phone             | string  | null: false |

### Association
 - belongs_to :buy