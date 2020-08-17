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
| emaill           | string  | null: false |
| password         | string  | null: false |
| confirm_password | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | date    | null: false |

### Association

- has_many :buy
- has_many :item
- belongs_to :transactions


## items テーブル
| Column          | Type    | Option                         |
| ----------------|---------|--------------------------------|
| image           | string  | null: false                    |
| name            | string  | null: false                    |
| explanation     | text    | null: false                    |
| category        | string  | null: false                    |
| item_status     | string  | null: false                    |
| delivery        | string  | null: false                    |
| delivery_days   | string  | null: false                    |
| price           | numeric | null: false                    |
| user_id         | integer | null: false, foreign_key: true |

### Association

- has_one :buy
- belongs_to :user
- has_many :comment


## comments テーブル
| Column          | Type    | Option                         |
|-----------------|---------|--------------------------------|
| comment         | text    |                                |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## buys テーブル
| Column                 | Type    | Option      |
|------------------------|---------|-------------|
| zip_code               | string  | null: false |
| prefectures            | integer | null: false |
| city                   | string  | null: false |
| address                | string  | null: false |
| building_name          | string  |             |
| phone_namber           | numeric | null: false |

### Associatoin

- belongs_to :user
- belongs_to :item
- has_one :transactions

## toransactions テーブル
| Column                | Type    | Option                         |
|-----------------------|---------|--------------------------------|
| users_id              | integer | null: false, foreign_key: true |

### Association

- belongs_to :byus
- has_many :users