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
| maill            | string  | null: false |
| password         | string  | null: false |
| confirm_password | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday_year    | date    | null: false |
| birthday_moth    | date    | null: false |
| birthday_day     | date    | null: false |

### Association

- has_one :buy
- has_one :item


## items テーブル
| Column          | Type    | Option                         |
| ----------------|---------|--------------------------------|
| image           | string  | null: false                    |
| item_name       | text    | null: false                    |
| explanation     | text    | null: false                    |
| category        | string  | null: false                    |
| item_status     | string  | null: false                    |
| delivery        | string  | null: false                    |
| area            | string  | null: false                    |
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
| credit_number          | numeric | null: false |
| validated_date_month   | numeric | null: false |
| validated_date_yser    | numeric | null: false |
| cord                   | numeric | null: false |
| zip_code               | numeric | null: false |
| prefectures            | numeric | null: false |
| city                   | string  | null: false |
| address                | string  | null: false |
| building_name          | string  | null: false |
| phone_namber           | numeric | null: false |

### Associatoin

- belongs_to :user
- belongs_to :item