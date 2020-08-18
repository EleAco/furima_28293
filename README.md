# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計
## users テーブル
| Column           | Type    | Options     |
| -----------------|---------|-------------|
| nickname         | string  | null: false |
| email           | string  | null: false |
| password         | string  | null: false |
| confirm_password | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | date    | null: false |

### Association
- has_many :items
- has_many :item_purchases


## items テーブル
| Column           | Type    | Option                         |
| -----------------|---------|--------------------------------|
| image            | string  | null: false                    |
| name             | string  | null: false                    |
| explanation      | text    | null: false                    |
| category_id      | integer | null: false                    |
| item_status_id   | integer | null: false                    |
| delivery_id      | integer | null: false                    |
| area_id          | integer | null: false                    |
| delivery_days_id | integer | null: false                    |
| price            | numeric | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :item_purchase


## comments テーブル
| Column          | Type    | Option                         |
|-----------------|---------|--------------------------------|
| comment         | text    |                                |
| item_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :item

## buys テーブル
| Column                 | Type    | Option                         |
|------------------------|---------|--------------------------------|
| zip_code               | string  | null: false                    |
| area_id                | integer | null: false                    |
| city                   | string  | null: false                    |
| addoress               | string  | null: false                    |
| building_name          | string  |                                |
| phone_number           | numeric | null: false
| item_purchase_id       | integer | null: false, foreign_key: ture |

### Associatoin

- belongs_to :item_purchase

## item_purchases テーブル
| Column                | Type    | Option                         |
|-----------------------|---------|--------------------------------|
| user_id               | integer | null: false, foreign_key: true |
| item_id               | integer | null: false, foreign_key: true |

### Association

- has_one :buy
- belongs_to :user
- belongs_to :item